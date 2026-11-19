-- Threat: !InfrastructureShared
-- Name: !#Lua:RTF_File
-- Type: 13
-- MpAttributes: BM_TEXT_FILE

if headerpage[1] ~= 123 or headerpage[2] ~= 92 or headerpage[3] ~= 114 or headerpage[4] ~= 116 then
  return mp.CLEAN
end
return mp.INFECTED
