-- Threat: !InfrastructureShared
-- Name: 1d9b325d6ab46
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("Execution_CommandAndScriptingInterpreter_Metasploit", false) then
  return mp.INFECTED
end
return mp.CLEAN
