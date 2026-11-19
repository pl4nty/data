-- Threat: !InfrastructureShared
-- Name: 1354023bb3ba9
-- Type: 21

if mp.get_mpattribute("SCPT:VirTool:JS/FunctionPacked.A") == false then
  return mp.INFECTED
end
return mp.CLEAN
