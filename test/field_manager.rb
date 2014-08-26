require 'singleton'
require '../test/field1'

class FieldManager
  include Singleton

  attr_reader  :field,:field_log

  def initialize
    @field = []
    @field = Field1.field.transpose
    @field_log=[]
  end

  def push(field)
    field = field.transpose
    @field_log << field
    @field = field
  end
end