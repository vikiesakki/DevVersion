class TestResque
  @queue = :send_value
  def self.perform
    puts '123'
  end
end
