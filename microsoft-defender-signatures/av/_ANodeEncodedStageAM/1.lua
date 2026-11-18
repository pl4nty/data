-- Threat: \xadANodeEncodedStage.AM
-- Type: 29
-- MpAttributes: Lua:NodeEncodedStage.AM

if mp.get_mpattribute("Lua:NpmLifecycleStage.AM") then
  return mp.CLEAN
end
return mp.INFECTED
