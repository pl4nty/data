-- Threat: !InfrastructureShared
-- Name: 2a78c67dc72a
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 500000 then
  local l_0_1 = pe.get_versioninfo()
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1.OriginalFilename
    l_0_2 = string.lower(l_0_2)
    if string.match(l_0_2, "xwormclient.exe") and (peattributes.isexe and peattributes.ismsil and peattributes.no_security) == true then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
