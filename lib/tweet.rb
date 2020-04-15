class Tweet
  attr_reader :id
  attr_accessor :message, :username

  def self.all
    # query table for ALL tweets
    sql = 'SELECT * FROM tweets'
    arr_of_hashes = DB[:conn].execute(sql)

    # create OBJs & add ID attribute 
    arr_of_hashes.map do |hash|
      Tweet.new(hash)
    end
  end

  def initialize(props={})
    # binding.pry
    @message = props['message']
    @username = props['username']
    @id = props['id']
  end

  def save
    # insert a new row into Tweets table, the val to be obj attr val
    sql = 'INSERT INTO tweets (username, message) VALUES (?,?)'

    DB[:conn].execute(sql, self.username, self.message)

    #set the ID attribut 4 our obj
    # need to sql the table to get THE LAST ROW INSERTED 
    id_sql = 'SELECT last_insert_rowid();'

    # binding.pry # want get a {id: 3}
    @id = DB[:conn].execute(id_sql)[0]['last_insert_rowid()']
  end


  # the code below this line will allow you to use @@all, but you want to move away from utilznig this variable

  # @@all = []

  # def self.all
  #   # query table for ALL tweets
  #   sql = 'SELECT * FROM tweets'
  #   arr_of_hashes = DB[:conn].execute(sql)

  #   # create OBJs & add ID attribute 
  #   arr_of_hashes.each do |hash|
  #     Tweet.new(hash)
  #   end

  #   # return @@all array 4 TweetsApps class to use
  #   @@all
  # end

  # def initialize(props={})
  #   # binding.pry
  #   @message = props['message']
  #   @username = props['username']
  #   @id = props['id']
  #   @@all << self
  # end
end
