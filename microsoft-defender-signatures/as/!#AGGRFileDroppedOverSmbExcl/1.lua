-- Threat: !#AGGR:FileDroppedOverSmbExcl
-- Type: 13
-- MpAttributes: AGGR:FileDroppedOverSmbExclFileExt

if not mp.get_mpattribute("BM_MZ_FILE") then
  mp.set_mpattribute("Lua:RemoteCopyExclusions")
  return mp.INFECTED
end
return mp.CLEAN
