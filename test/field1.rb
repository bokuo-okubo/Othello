module Field1

  @@field=[
                 [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 2, 1, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 1, 2, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
                ]

  def field
    return @@field
  end

  module_function :field
end