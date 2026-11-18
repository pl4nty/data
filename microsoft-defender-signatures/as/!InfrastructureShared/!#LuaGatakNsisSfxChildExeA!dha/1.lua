-- Threat: !InfrastructureShared
-- Name: !#Lua:GatakNsisSfxChildExe.A!dha
-- Type: 13
-- MpAttributes: SCRIPT:GatakNsisInstData | //GatakNsisInstData

if mp.get_mpattribute("SCRIPT:GatakNsisInstData") then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 3000 or 4000 < l_0_0 then
    return mp.CLEAN
  end
  mp.set_mpattribute("//GatakNsisInstData")
  return mp.CLEAN
end
if mp.get_mpattribute("//GatakNsisInstData") then
  local l_0_1 = string.lower(mp.getfilename())
  if l_0_1 ~= nil then
    if string.find(l_0_1, "%(nsis%-6%-%d+%.exe%)$") then
      return mp.INFECTED
    end
    if string.find(l_0_1, "%(nsis%-6%-install%d+%.exe%)$") then
      return mp.INFECTED
    end
    if string.find(l_0_1, "%(nsis%-6%-setup%d+%.exe%)$") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
