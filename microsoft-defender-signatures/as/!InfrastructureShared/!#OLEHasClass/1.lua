-- Threat: !InfrastructureShared
-- Name: !#OLEHasClass
-- Type: 13
-- MpAttributes: SIGATTR:JAVAFile

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 17 then
  return mp.CLEAN
end
if string.find(l_0_0, "word/embeddings/oleobject%d.+bin.+->.+%.class$") or string.find(l_0_0, "ole stream %d.+->.+%.class$") then
  return mp.INFECTED
end
return mp.CLEAN
