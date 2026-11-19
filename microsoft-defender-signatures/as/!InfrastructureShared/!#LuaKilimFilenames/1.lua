-- Threat: !InfrastructureShared
-- Name: !#Lua:KilimFilenames
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    ["arsiv.exe"] = true,
    ["chromenet.exe"] = true,
    ["chromium.exe"] = true,
    ["app.exe"] = true,
    ["winsnrnr.exe"] = true,
    ["denemeisim.exe"] = true
  }
  local l_0_2 = {
    ["asdfghjklmn.exe"] = true,
    ["dwmvs.exe"] = true,
    ["tplmk.exe"] = true,
    ["goup.exe"] = true,
    ["per.zip"] = true,
    ["nod32.exe"] = true,
    ["google.exe"] = true
  }
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1[l_0_4] then
    if string.sub(l_0_3, -16) == "\\appdata\\roaming" or string.sub(l_0_3, -17) == "\\application data" then
      return mp.INFECTED
    end
  elseif l_0_2[l_0_4] and l_0_3 == "c:\\windows" then
    return mp.INFECTED
  end
  if l_0_3 == "c:" and (l_0_4 == "debgr.txt" or l_0_4 == "chrome1.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
