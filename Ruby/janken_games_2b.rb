class Player
  PAPER = 0
  SCISORS = 1
  STONE = 2
  POINTS_TO_WIN = 3
  WIN = {
    [PAPER, STONE] => true,
    [SCISORS, PAPER] => true,
    [STONE, SCISORS] => true
  }
  HANDS = ["パー", "チョキ", "グー"]
  
  def initialize(name)
    @point = 0
    @choice = nil
    @name = name
  end

  def fight(other)
    while !victory? && !other.victory?
      decide_human()
      other.decide_computer()
      puts "#{name}：#{HANDS[choice]}, #{other.name}：#{HANDS[other.choice]}"
      judge(other)
      other.judge(self)
    end
  end 
  
  def victory_speech()
    if victory?
      puts "#{name}の勝ち！"
    end
  end

  protected

  def decide_human()
    puts "パーは0、チョキは1、グーは2を入れてください。"
    @choice = Integer(gets())
  end

  def decide_computer()
    @choice = rand(3)
  end

  attr_reader :choice
  attr_reader :name

  def judge(other)
    if WIN[[choice, other.choice]]
      @point += 1
    end
  end
 
  def victory?
    @point == POINTS_TO_WIN
  end
end

computer = Player.new("コンピュータ")
player = Player.new("あなた")
player.fight(computer)
computer.victory_speech()
player.victory_speech()
