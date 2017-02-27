require '/Users/sai/Documents/ada/cs_fun/stacks-queues/lib/Queue.rb'
require '/Users/sai/Documents/ada/cs_fun/stacks-queues/lib/Stack.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize jobs_available, job_seekers
    @waiting = Queue.new
    job_seekers.times do |seeker|
      @waiting.enqueue("Worker ##{seeker+1}")
    end

    @workers = Stack.new
    jobs_available.times do |worker|
      @workers.push(@waiting.dequeue)
    end
  end


    def cycle
      roll = rand(1..6)

      puts "We are moving #{roll} people"
      roll.times do
        puts "Fire: #{@workers.top}"
        @waiting.enqueue(@workers.pop)
      end

      roll.times do
        puts "Hire: #{@waiting.front}"
        @workers.push(@waiting.dequeue)
      end
      #take roll number of workers off the end of the stack and move them to back of waiting.
      #take roll number of waiting from the front of queue and move them to back of workers
    end

  end

  ## Allows us to run our code and see what's happening:
  sim = JobSimulation.new(6,10)
  puts "------------------------------"
  puts "Before the simulation starts"
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
  puts "------------------------------"
  print "<enter to cycle>\n"

  count = 0
  until gets.chomp != ""
    puts "-------Cycle #{count+=1}-------"
    sim.cycle
    puts "Employed: #{sim.workers}"
    puts "Waitlist: #{sim.waiting}"
  end

# SAMPLE RUN OF CODE
#
# ------------------------------
# Before the simulation starts
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #4", "Worker #5", "Worker #6"]
# Waitlist: ["Worker #7", "Worker #8", "Worker #9", "Worker #10"]
# ------------------------------
# <enter to cycle>
#
# -------Cycle 1-------
# We are moving 3 people
# Fire: Worker #6
# Fire: Worker #5
# Fire: Worker #4
# Hire: Worker #7
# Hire: Worker #8
# Hire: Worker #9
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #7", "Worker #8", "Worker #9"]
# Waitlist: ["Worker #10", "Worker #6", "Worker #5", "Worker #4"]
#
# -------Cycle 2-------
# We are moving 2 people
# Fire: Worker #9
# Fire: Worker #8
# Hire: Worker #10
# Hire: Worker #6
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #7", "Worker #10", "Worker #6"]
# Waitlist: ["Worker #5", "Worker #4", "Worker #9", "Worker #8"]
#
# -------Cycle 3-------
# We are moving 1 people
# Fire: Worker #6
# Hire: Worker #5
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #7", "Worker #10", "Worker #5"]
# Waitlist: ["Worker #4", "Worker #9", "Worker #8", "Worker #6"]
#
# -------Cycle 4-------
# We are moving 6 people
# Fire: Worker #5
# Fire: Worker #10
# Fire: Worker #7
# Fire: Worker #3
# Fire: Worker #2
# Fire: Worker #1
# Hire: Worker #4
# Hire: Worker #9
# Hire: Worker #8
# Hire: Worker #6
# Hire: Worker #5
# Hire: Worker #10
# Employed: ["Worker #4", "Worker #9", "Worker #8", "Worker #6", "Worker #5", "Worker #10"]
# Waitlist: ["Worker #7", "Worker #3", "Worker #2", "Worker #1"]
