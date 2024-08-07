## Group members: Ghanem Alqashanin (s2473257) and Uzay Karadag (s2592749) and Krupa Savsani (s2597114)
## Equal contribution.
# This is a document that has a code containing a function called (qsim). The (qsim) function  is to simulate cars passing through French and then British passport control at a French ferry terminal. Before each part of this code, there will be a small paragraph to explain the general idea of this part in the context of the practical (2). In addition, after each part, there will be a few lines to explain each line separately and illustrate the functions that we used. In the last part of this code, we will intrduce a function to calculate the possibility that at least one car will miss the ferry's departure. Moreover, in the last part of the code, we added a brief discussion to explain the implications of small extra delays in British checking.



# Firstly:
# In order to write the simulation function, we initialize the necessary data structures and variables to simulate the queuing system. For instance, the French and British queues and the data vectors of average queuing lines etc.  Moreover, there will be some variables to update these structures to model the arrival, processing, and departure of French and British cars at the border checkpoint. As the simulation develops, the initialization variables are crucial for capturing and following the dynamics of the queuing system.


qsim <- function(mf, mb, a.rate, trb, trf, tmb, tmf, maxb) {
  
  nf <- numeric(7200)  
  nb <- numeric(7200)
  eq <- numeric(7200)
  
  French_queues <- numeric(mf)
  British_queues<- numeric(mb)
  
  
  tmf_min <- tmf  
  tmf_max <- tmf + trf
  tmb_min <- tmb  
  tmb_max <- tmb + trb
  
  French_processing <-  runif(1, min = tmf_min, max = tmf_max)
  British_processing <- runif(1, min = tmf_min, max = tmf_max)
  nxt_French_arrival <- rexp(1, a.rate)
  nxt_British_arrival <- Inf
  
  
  ## Closer look to the previous lines:
  # nf, nb, and eq are initialized as empty numeric vectors with a length of 7200 (in seconds), which corresponds to a 2-hour simulation. These vectors will store data over time.
  # French_queues and British_queues are initialized as empty numeric vectors. These represent the queues for French and British cars, respectively.
  
  # (tmf_min AND tmf_max) means that the actual processing time for a French car will be somewhere between tmf_min and tmf_max.
  # (tmb_min AND tmb_max) means that the actual processing time for a British car will be somewhere between tmb_min and tmb_max.
  # (French_processing <-runif(1, min = tmf_min, max = tmf_max)) this line generates a single random processing time for a French car. It is a random value within the range defined by tmf_min and tmf_max. Similarly, (runif(1, min = tmb_min, max = tmb_max)) generates a single random processing time for a British car within the range defined by tmb_min and tmb_max.
  
  # nxt_French_arrival is  used to simulate the time until the next arrival of a French cars based on the rate (a.rate) which  represents the time until the next arrival of a car at French station. The (rexp) function in R is typically used for simulating the time between events in a Poisson process, where events occur at a constant average rate. 
  # nxt_British_arrival is initially set to positive infinity, because the arrival time of the first car that arrive British stations is undefined at the start of the simulationis. This is a common approach when simulating queuing systems where the initial arrival time of cars is not specified.
  
  
  # Secondly: 
  # In this section of the code, the simulation models cars arriving at French passport control stations and the subsequent updating of French queues. Starting by determining if a car arrives based on a given probability (0.1), and if so, assigns the car to the shortest French queue. Processing times for cars at the French stations are reduced until a car is fully processed, at which point it either moves to the British queues if there's capacity (when the summation of British queues is less than 5*20) or is placed back in the French queue. This dynamic process accounts for the flow of cars through the French passport control system, balancing processing and queue capacities, and is vital for simulating border control scenarios effectively.
  
  for (t in 1:7200) {
    if (runif(1) < a.rate) {
      French_queues[which.min(French_queues)] <- French_queues[which.min(French_queues)] + 1
    }
    for (i in 1:mf) {
      if (!is.na(French_processing[i])) {
        French_processing[i] <- French_processing[i] - 1
        if (French_processing[i] == 0) {
          if (sum(!is.na(British_queues)) < mb * maxb) {
            Shortest_British <- which.min(British_queues)
            British_queues[Shortest_British] <- c(British_queues[Shortest_British], 1)
            French_processing[i] <- NA
          } else {
            French_queues[i] <- c(French_queues[i], 1)
            French_processing[i] <- NA
          }
        }
      }
    }
    if (t > 5400) {
      break  
      
    }
    
    ## Closer look to the previous lines:
    # for (t in 1:7200) is a loop that iterates over 7200 time steps (two-hours).
    # (runif(1)) is used to generate a single random number from a uniform distribution in the range [0, 1]. It then checks if this random number is less than the specified arrival rate a.rate. This part (which.min(French_queues)) identifies the index of the French queue with the shortest length. Then, (French_queues[which.min(French_queues)] + 1) accesses the identified queue by using its index and increments the length of the identified French queue by 1, signifying the arrival of a new car at that queue.
    # for (i in 1:mf), is an inner loop that iterates over the French queues.
    # if (!is.na(French_processing[i])) this line checks whether there is an active car (not marked as NA) being processed in the i-th French queue. If there is an active car, the code inside the if statement will be executed. If there is no active car in that queue, the code within the if block will be skipped.
    # (French_processing[i]) this part of the code accesses the processing time of the car in the i-th French queue. (French_processing[i] - 1) this line subtracts 1 from the current processing time. The entire line is to reduce the remaining processing time for the French car in the i-th French queue by one second.
    #  (if (French_processing[i] == 0))is used to check whether the remaining processing time for the French car in the i-th French queue has reached zero. If the processing time equals zero, it indicates that the car has been fully processed, and the queuing needs to decide what to do with the departing car.
    #  (if (sum(!is.na(British_queues)) < mb * maxb)) this line is used to check if there is enough capacity in the British queues to accommodate the departing French car. (mb * maxb) this part of the code is to calculate a value representing the maximum capacity of the British queues.
    # (Shortest_British <- which.min(British_queues)) this line is used to find the British queue with the shortest length (fewest car) and then add a new British car (represented as 1) to that queue.
    # (which.min(...)), returns the index of the first occurrence of the minimum value in the British_queues vector.
    # (British_queues[Shortest_British]) is used to access the British queue with the shortest length. While ((British_queues[Shortest_British], 1)) is a new vector that combines the existing cars of the British queue with a new element (car), which represents the arrival of a British car. In this case, the new element is 1, indicating the arrival of one car coming to the British stations.
    # (French_processing[i] <- NA) this part sets the processing time of the French car to "Not Available," indicating that the car has been transferred to a British queue. If there is not enough capacity in the British queues this line (French_queues[i] <- c(French_queues[i], 1)) will add the French car back to the end of the i-th French queue, assuming there's no capacity in the British queues.
    # This part (French_processing[i] <- NA) sets the processing time of the French car to "Not Available," indicating that the car is still in the French queue.
    #  (if (t > 5400) ) this statement closes check-in, so that no new cars arrive in the final 30 minutes 5400 seconds.
    
    
    
    
    # Thirdly:
    #This section of the code makes sure that each car in the British lines is processed individually before being pulled from the line to make space for the next car to be processed. It also takes into account the British lines' 20-car maximum per line capacity by deleting processed cars and updating the queues' status as necessary.
    
    for (i in 1:mb) {
      if (!is.na(British_processing[i])) {
        British_processing[i] <- British_processing[i] - 1
        if (British_processing[i] == 0) {
          British_queues[i] <- British_queues[i][-1]
          British_processing[i] <- NA
        }
      }
    }
    
    ## Closer look to the previous lines:
    # The for loop here is to iterate over each British queue (indexed by i) in the range from 1 to the total number of British queues (mb).
    # This part (if (!is.na(British_processing[i]))) checks if there is an active car being processed in the i-th British queue. In addition, it ensures that the processing time is not "Not Available" (NA), which would mean there is no car currently being processed in that queue. Moreover, if there is an active car in the British queue (British_processing[i] is not NA), the code proceeds to update its processing time.
    # This part (British_processing[i] <- British_processing[i] - 1) reduces the remaining processing time for the car in the i-th British queue by one second.
    # This part (if (British_processing[i] == 0)) checks if the processing time for the car in the i-th British queue has reached zero, indicating that the car has been fully processed.
    
    # (British_queues[i] <- British_queues[i][-1]) removes the first car from the i-th British queue, effectively marking it as processed and dequeued.
    # (British_processing[i] <- NA) sets the processing time of the car to "Not Available" (NA), indicating that the queue is now empty, and there's no car being processed in that British queue.
    
    
    
    # Then, 
    # This part of the code controls the stochastic arrival of French cars at the French passport control. When it's time for a car to arrive, it updates the arrival time and adds the car to the queue. If it's not time for a new car, it simply counts down the time until the next car's arrival, ensuring that the simulation progresses in discrete time steps.
    
    if (nxt_French_arrival <= 0) {
      nxt_French_arrival <- rexp(1, a.rate)
      French_queues <- c(French_queues, 1)
    } else {
      nxt_French_arrival <- nxt_French_arrival - 1
    }
    
    ## Closer look to the previous lines:
    # The (if) statement here checks if the value of nxt_French_arrival is less than or equal to zero. If the condition is true, it means that the time has come for a new French car to arrive. Moreover, it determines if it's time for a new car to arrive based on the defined inter-arrival time distribution.
    # This part (French_queues <- c(French_queues, 1) is used to add a new car to the queue of French cars in the queuing system simulation.
    # This line (nxt_French_arrival <- nxt_French_arrival - 1) is executed when the condition in the if statement is not met, which indicates that it's not yet time for a new French car to arrive. Additionally, it used to decrement the time remaining until the next French car arrival by one time step.
    
    
    # Next,
    #  We made sure of controling the stochastic arrival of British cars at the British passport control by using this part of the code. In otherwords, when it's time for a car to arrive, it updates the arrival time and adds the car to the shortest available British queue, ensuring that the simulation follows the defined arrival rate and capacity constraints of the queues. If it's not yet time for a new car to arrive, it simply counts down the time until the next car's arrival. 
    
    if (nxt_British_arrival <= 0) {
      nxt_British_arrival <- rexp(1, a.rate)
      if (sum(!is.na(British_queues)) < mb * maxb) {
        Shortest_British <- which.min(British_queues)
        British_queues[Shortest_British] <- c(British_queues[Shortest_British], 1)
      }
    } else {
      nxt_British_arrival <- nxt_British_arrival - 1
    }
    
    ## Closer look to the previous lines:
    # Here explanation for the code above, (if (nxt_British_arrival <= 0)) is used to check if it's time for a new car to arrive at the British passport control. Based on the a.rate probability.
    # (sum(!is.na(British_queues)) < mb * maxb) checks if there is enough capacity in the British queues by calculating the current number of cars in the British queues. If the count is less than mb * maxb which is (5*20) in this simulation, it means there's a space for a new car. Moreover, if there is space the new car goes to the shortest british queue using these two lines (Shortest_British <- which.min(British_queues)) and (British_queues[Shortest_British] <- c(British_queues[Shortest_British], 1)) respectively. If there is no space in the British queues for a new car this line (nxt_British_arrival <- nxt_British_arrival - 1) subtracts one second from the time until the arrival of the next British car.
    
    # Moving to the next part:
    #By updating each vector of data for each time step in the simulation, we can gain insights into the dynamics of the queues, processing times, and expected waiting times as the simulation progresses. This gives us a comprehensive view of the simulation by identifying the average of the French and British passport control stations as well as the expected time. 
    
    nf[t] <- sum(lengths(French_queues)) / mf
    nb[t] <- sum(lengths(British_queues)) /mb 
    eq[t] <- (nf[t] * tmf)  / (nb[t] * tmb)
    
  }
  
  ## Closer look to the previous lines:
  # (nf[t] <- sum(lengths(French_queues)) / mf) this line computes the average length of the French queues by summing the lengths of all French queues using sum(lengths(French_queues)) and then dividing this sum by the total number of French queues, mf. The line (nb[t] <- sum(lengths(British_queues)) /mb) does exactly the same to the British queues in order to get the average length of the British queues.
  # This line (eq[t] <- (sum(nf) * (tmf + trf)) / (a.rate)) calculates the average expected waiting time for a car at the start of the French queue at the t-th second of the simulation.
  
  return(list(nf = nf, nb = nb, eq = eq))
}

# Running with the default parameters:
set.seed(0)
DFLT_RSLT <- qsim(mf = 5, mb = 5, a.rate = 0.1, trb = 40, trf = 40, tmb = 30, tmf = 30, maxb = 20)

# Running with with tmb = 40
set.seed(40)
RSLT_tmb40 <- qsim(mf = 5, mb = 5, a.rate = 0.1, trb = 40, trf = 40, tmb = 40, tmf = 30, maxb = 20)

# (DFLT_RSLT) is used to store the qsim function to simulate the passport control queues with the given parameters.
# (RSLT_tmb40) is used to store the qsim function to simulate the passport control queues with the given parameters but changing the value of (tmb) to 40 seconds. 


# The resulting 4-panel plot allows us to compare the average queue lengths in French and British stations and expected waiting times between the default scenario and the one with increased British processing time.

# Plot the results
par(mfrow=c(2, 2)) # sets up a plotting layout with 2 rows and 2 columns.

plot(DFLT_RSLT$nf, type = "l", xlab = "Time (s)", ylab = "French and British Queues avg. Length")
lines(DFLT_RSLT$nb, col = "blue")
legend("topleft", legend = c("French Queue", "British Queue"), col = c("black", "blue"), lty = 1)

# In terms of plotting (French and British Queues avg. Length) the (plot) function is used to create the initial plot, and (lines) adds additional lines to the existing plot, while (legend) adds a legend to help interpret the lines on the plot.


plot(DFLT_RSLT$eq, type = "l", xlab = "Time (s)", ylab = "Expected Queue Time (Seconds)") # To plot the average expected waiting time for a car at the start of the french queue for each second of the simulation.

plot(RSLT_tmb40$nf, type = "l", xlab = "Time (s)", ylab = "French and British Queues avg. Length tmb40")
lines(RSLT_tmb40$nb, col = "blue")
legend("topleft", legend = c("French Queue", "British Queue"), col = c("black", "blue"), lty = 1)

plot(RSLT_tmb40$eq, type = "l", xlab = "Time (s)", ylab = "Expected Queue Time40 (Seconds)")

# The previous four lines are for plotting the graph with different (minimum British handling time).

# Finally:
# We will intrduce a function to calculate the possibility that at least one car will miss the ferry's departure. We will implement that by using our qsim function 100 times.

EST_PROB <- function(mf, mb, a.rate, trb, trf, tmb, tmf, maxb, repetitions) {
  AT_LEAST_ONE <- 0
  for (i in 1:repetitions) {
    RSLT <- qsim(mf, mb, a.rate, trb, trf, tmb, tmf, maxb)
    if (RSLT$nf[5400] > 0 || RSLT$nb[7200] > 0) {
      AT_LEAST_ONE <- AT_LEAST_ONE + 1
    }
  }
  return(AT_LEAST_ONE / repetitions)
}

# The function (EST_PROB) takes the simulation parameters (mf, mb, a.rate, trb, trf, tmb, tmf, maxb) and the number of repetitions to run (repetitions).
# (AT_LEAST_ONE <- 0) this line initializes a variable named AT_LEAST_ONE to zero. This variable will be used to count the number of times at least one car misses the ferry's departure in the simulations.
# This part (for (i in 1:repetitions)) starts a loop that will run for the specified number of repetitions. The loop will repeat the simulation and check if at least one car misses the ferry's departure in each iteration.
# (RSLT <- qsim(mf, mb, a.rate, trb, trf, tmb, tmf, maxb)): in each iteration, this line runs the qsim function with the given parameters, simulating the passport control queues.
# (if (RSLT$nf[5400] > 0 || RSLT$nb[7200] > 0)): this line checks if, at the end of the simulation (at time 7200 seconds), there are cars still waiting in either the French queues (nf) or the British queues (nb). If there are, it means at least one car has missed the departure. If there is at least one car that missed the departure in the current iteration, this line (AT_LEAST_ONE <- AT_LEAST_ONE + 1) increments the (AT_LEAST_ONE) counter by 1.

# Estimate the probability for 100 repetitions
set.seed(4)
THE_PROB <- EST_PROB(mf = 5, mb = 5, a.rate = 0.1, trb = 40, trf = 40, tmb = 30, tmf = 30, maxb = 20, repetitions = 100)
print(paste("The probability of at least one car miss the ferry's departure:", THE_PROB))

# Finally, print(paste(...) is used to output the result, which reflects the calculated probability, to the console. A message stating "The probability of at least one car missing the ferry's departure:" is followed by the computed probability kept in the variable THE_PROB in the output. 

# In conclusion, the last result suggests that under the specified parameters and assumptions, there was a high probability that at least one car would be in the queue at the end of the 2-hour simulation period, and thus, it missed the ferry's departure.


## The following paragraph is for explaining the implications of small extra delays in British checking:

# In this simulation, even small delays in passport checking in the UK can have consequences. These delays will increase the average queue length at UK passport control, leading to longer waiting times. Since the maximum capacity of each British line is 20 cars, this can lead to additional delays and inefficiency. In other words, cars cannot go after finishing from the French control to the British stations if the queues in the UK are full. Therefore, a small delay in British inspection could significantly affect the overall efficiency of the border control process. 

###DONE###
