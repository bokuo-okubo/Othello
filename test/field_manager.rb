require 'singleton'
requireire './field1'

class FieldManager
  include Singleton

  attr_reader  :field,:field_log

  def initialize
    @field = []
    @field = Field1.field
    @field_log=[]
  end

  def push(field)
    @field_log << field
    @field = field
  end
end