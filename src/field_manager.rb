require 'singleton'
require '../src/field1'


class FieldManager
  include Singleton
  attr_reader :field,:field_log

  def initialize
    @field = []
    @field = Field1.field.transpose
    @field_log = []
  end

  def push(field)
    _field = field.transpose
    @field_log << field
    @field = _field
  end
end


# FieldManager.instance.field.each{|arr| print arr,"\n"}