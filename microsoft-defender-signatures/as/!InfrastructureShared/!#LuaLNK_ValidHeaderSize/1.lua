-- Threat: !InfrastructureShared
-- Name: !#Lua:LNK_ValidHeaderSize
-- Type: 12
-- MpAttributes: BM_LNK_FILE

if mp.getfilesize() > 76 then
  return mp.INFECTED
end
return mp.CLEAN
