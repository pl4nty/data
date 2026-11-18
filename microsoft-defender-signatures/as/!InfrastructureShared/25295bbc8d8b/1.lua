-- Threat: !InfrastructureShared
-- Name: 25295bbc8d8b
-- Type: 21

if mp.getfilesize() <= 4096 then
  local l_0_0
  l_0_0 = mp.getfilename()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0:sub(-19) == "->word/document.xml" then
    return mp.INFECTED
  end
end
return mp.CLEAN
