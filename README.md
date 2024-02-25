I designed a system to control an elevator in a GF+12 storey hotel. The implementation and simulation of the elevator was done in Active-HDL, as it is easier to understand for all VHDL connoisseurs. The simulation of the elevator was done by creating a waveform, giving values to the signals using the Stimulators option and watching how the results change. For the elevator implementation and design, we used the most usable method, namely component splitting. Functionality: The implemented elevator satisfies the demands of people inside and the demands from outside (up, down) that arise along the way from the doors on each level. Requests are honoured in the order of floors, regardless of where they come from (elevator or outside). We considered the elevator to be on the ground floor at first, with the doors open. The elevator has an input that detects when the maximum weight is exceeded and an input that detects if someone is in the door and does not start in this case. In short, the lift does not start unless the doors are closed. The doors must be open for a programmable period of time and the lift speed can be selected between two values: 1 or 3 seconds/step.
