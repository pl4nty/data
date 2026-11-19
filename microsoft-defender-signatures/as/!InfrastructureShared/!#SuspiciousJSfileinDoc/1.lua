-- Threat: !InfrastructureShared
-- Name: !#SuspiciousJSfileinDoc
-- Type: 13
-- MpAttributes: Lua:JSExt & Nscript:Type_js

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 14 then
  return mp.CLEAN
end
if string.match(l_0_0, "word/embeddings/oleobject%d.+bin.+->.+%.js$") or string.match(l_0_0, "ole stream %d.+->.+%.js$") then
  return mp.INFECTED
end
return mp.CLEAN
