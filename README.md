## Motivation
[The Evolution of a Smile](https://github.com/peterbraden/genetic-lisa#the-evolution-of-a-smile)   
We want to transfer the concept of data compression and reconstruction in visual domain to acoustic domain.

## Target list
- Higher quality of reconstruction than traditional method (Sinusoidal modeling).
- Less demanded data for reconstruction.
- Less computation time.   


## Implementatoin details
### Basic idea
Evolute into a specific audio file from zeros by adding multiple ractangular windows together directly in **time domain**. 
![Rac. window](./rac.jpg)
### Chromosomes
- Position and length of window -> fixed window length and position
- Magnitude of window
### Fitness
- Sample-to-sample MSE.
- Multi-tube model and Levinson-Durbin algo.
### Parameter 
- Window length : 10 samples
- Hop size : window length
- Population per window : 8
- Generation per window : 100
- Initial state : zero array
- Sigma : random choosed from [0.1, 0.01, 0.001]
### Structure 
1. For each window
2. Generate population
3. Choose best 4 and discard worst 4 based on fitness function
4. Crossover these 4 and also mutate these 4 to generate next generation
### Video demo 
[![Audio reconstruction](./src.jpg)](https://www.youtube.com/watch?v=eCdiK1sR-mE) 
### Compression degree
Let demanded data decreases to (original samples)/(window length).
