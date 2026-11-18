-- Threat: !InfrastructureShared
-- Name: 8eb3ce2576fc
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  if l_0_0:find("analysis\\atpvbaen.xlam", 1, true) then
    return mp.CLEAN
  elseif l_0_0:find("solver\\solver.xlam", 1, true) then
    return mp.CLEAN
  elseif l_0_0:find("microsoft.-ni.dll") then
    return mp.CLEAN
  elseif l_0_0:find("msip.-ni.dll") then
    return mp.CLEAN
  elseif l_0_0:find("pfx%..-ni.dll") then
    return mp.CLEAN
  elseif l_0_0:find("newtonsoft.json.ni.dll") then
    return mp.CLEAN
  elseif l_0_0:find("addinexpress.-.dll") then
    return mp.CLEAN
  elseif l_0_0:find("telerik.-.dll") then
    return mp.CLEAN
  elseif l_0_0:find("tcaddin.dll") then
    return mp.CLEAN
  elseif l_0_0:find("chemdraw for excel\\chemdrawexcel", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:match("[^ ]+[\"]?(.*%.xll[\"]?)")
  if l_0_1 ~= nil then
    if sysio.IsFileExists(l_0_1) == true then
      bm.add_related_file(l_0_1)
    else
      l_0_1 = "%appdata%\\microsoft\\addins\\\\" + l_0_1
      l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
      if sysio.IsFileExists(l_0_1) == true then
        bm.add_related_file(l_0_1)
      end
    end
  end
end
return mp.INFECTED
