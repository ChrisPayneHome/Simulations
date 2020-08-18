Not_Changing_Wins <- 0
Changing_Wins <- 0

for(i in seq(0, 100000)){

	print(sprintf("Beginning Simulation %d", i))
	
	Goat_1 <- sample.int(3, 1)

	repeat {
		Goat_2 <- sample.int(3, 1)
		if(Goat_1 != Goat_2){
			break
		}
	}


	repeat {
		Car <- sample.int(3, 1)
		if((Car != Goat_1) & (Car != Goat_2)){
			break
		}
	}
	
	Choice <- sample.int(3, 1)

	#Now that we have created the game, now we must remove one of the choices

	if(Choice == Goat_1){
		removed_opt <- Goat_2
		rm(Goat_2)
	} else if(Choice == Goat_2){
		removed_opt <- Goat_1
		rm(Goat_1)
	} else if(Choice == Car){
		repeat {
			remove <- sample.int(3, 1)
			if(remove == Goat_1){
				removed_opt <- Goat_1
				rm(Goat_1)
				rm(remove)
				break
			} else if(remove == Goat_2){
				removed_opt <- Goat_2
				rm(Goat_2)
				rm(remove)
				break
			}
		}
	}

	#With one of the Goats gone, we now simulate the changing/not changing of choices and record the winners

	if(Choice == Car){
		Not_Changing_Wins <- Not_Changing_Wins + 1
		print("The Player Who Didn't Change Won Their Game")
	} else {
	}

	repeat {
		Change_Choice <- sample.int(3, 1)
		if((Change_Choice != Choice) & (Change_Choice != removed_opt)){
			rm(Choice)
			break
		}
	}

	if(Change_Choice == Car){
		Changing_Wins <- Changing_Wins + 1
		print("The Player who Changed Won Their Game")
	} else {
	}

	print(sprintf("Completed Simulation %d", i))

}

#Finally we print the results of the simaulation and compare

print("Completed Simulations")

print(sprintf("Out of 100,000 Simulations, the player who changed won: %.3f per cent", ((Changing_Wins / 100000) * 100)))
print(sprintf("Out of 100,000 Simulations, the player who didn't change won %.3f per cent", ((Not_Changing_Wins / 100000) * 100)))




