-- Threat: !InfrastructureShared
-- Name: !#Lua:VBHasExpensiveLoop
-- Type: 10
-- MpAttributes: MpHasExpensiveLoop

if peattributes.isvbnative == true then
  mp.set_mpattribute("Lua:VBHasExpensiveLoop")
end
return mp.CLEAN
