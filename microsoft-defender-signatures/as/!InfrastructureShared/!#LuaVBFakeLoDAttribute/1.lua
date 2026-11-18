-- Threat: !InfrastructureShared
-- Name: !#Lua:VBFakeLoDAttribute
-- Type: 8

if peattributes.isvbnative == true then
  mp.set_mpattribute("LoD:VBStudyExpensiveLoops")
end
return mp.CLEAN
