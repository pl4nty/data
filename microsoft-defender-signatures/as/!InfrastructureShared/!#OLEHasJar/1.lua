-- Threat: !InfrastructureShared
-- Name: !#//OLEHasJar
-- Type: 13
-- MpAttributes: Lua:JARExt

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 15 then
  return mp.CLEAN
end
if string.find(l_0_0, "word/embeddings/oleobject%d.+bin.+->.+%.jar$") or string.find(l_0_0, "ole stream %d.+->.+%.jar$") then
  return mp.INFECTED
end
return mp.CLEAN
