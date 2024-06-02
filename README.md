# Electronics-Circuit-Simulator

## Overview
This repository contains the codebase for an electronics circuit simulator written in MATLAB

## Requirements
- MATLAB with Symbolic Math toolbox 

## Supported Components
- Resistor (res.m)
- Conductance (cond.m)
- Capacitor (cap.m)
- Inductor (ind.m)
- Diode (diode.m)
- Constant Voltage Source (vol.m)
- Current-Controlled Voltage Source (ccvs.m)
- Voltage-Controlled Voltage Source (vcvs.m)
- Constant Current Source
- Current-Controlled Current Source (cccs.m)
- Voltage-Controlled Current Source (vccs.m)
- Ideal Op-Amp (opa.m)
- Non-Ideal Op-Amp (ni_opa.m)
- Wire/Short-Circuit (sckt.m)

## Running a Simulation
Check the example in **TEST.m** and **TEST_circuit.m**.

To run a simulation on any circuit, start by numbering all the nodes in the circuit. Then add the netlist of components in **TEST.m** using the functions for the supported components above. Finally, run the script.