-- Threat: !InfrastructureShared
-- Name: !#ExtractedTaskSchedCmd.A
-- Type: 12

local l_0_0 = mp.getfilename()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "[TaskCommand]", 1, true) then
  mp.set_mpattribute("Lua:TaskCommandContext")
  return mp.INFECTED
end
return mp.CLEAN
