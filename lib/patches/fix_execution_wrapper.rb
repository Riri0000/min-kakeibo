# frozen_string_literal: true

raise('Consider removing this patch') if RUBY_VERSION != '2.7.2'

module Patches
  # Rubyが稀にSegmentation faultでエラーになる問題を修正するパッチ。
  #
  # `Thread.current` の代わりに `Thread.current.object_id` を使うこと
  # で#hashの実行時に他スレッドがテーブルを弄るのを避けます。
  #
  # 元の実装は以下を参照してください。
  # ref: https://github.com/rails/rails/blob/v6.0.2.1/activesupport/lib/active_support/execution_wrapper.rb
  #
  # ## Issue
  #
  # `#hash` can change Hash object from ar_table to st_table
  # ref: https://bugs.ruby-lang.org/issues/16676
  module FixExecutionWrapper
    def self.active?
      @active[Thread.current.object_id]
    end

    def run!
      self.class.active[Thread.current.object_id] = true
      run_callbacks(:run)
    end

    def complete!
      run_callbacks(:complete)
    ensure
      self.class.active.delete Thread.current.object_id
    end
  end
end

ActiveSupport::ExecutionWrapper.prepend(Patches::FixExecutionWrapper)
