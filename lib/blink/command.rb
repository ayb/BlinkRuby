module Blink
  class Command
    attr_reader :id, :created_at, :updated_at, :execute_time, :command, :state_stage, :attempts

    def initialize id, created_at, updated_at , execute_time, command, stage_stage, attempts
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @execute_time = execute_time
      @command = command
      @state_stage = state_stage
      @attempts = attempts
    end
  end
end