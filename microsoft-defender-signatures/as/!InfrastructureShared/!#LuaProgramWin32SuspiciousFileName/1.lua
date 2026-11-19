-- Threat: !InfrastructureShared
-- Name: !#Lua:Program:Win32/SuspiciousFileName
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.getfilename())
  if string.sub(l_0_1, -4) == ".exe" then
    local l_0_2, l_0_3 = l_0_1:match("(.+\\)([^\\]+)$")
    local l_0_4 = l_0_3:len()
    if string.find(l_0_1, "\\temp\\", 1, true) then
      if 9 < l_0_4 and l_0_4 < 20 then
        if string.match(l_0_3, "^%d_offer_%d+%.exe") or string.match(l_0_3, "^%d_offer_%d+_%d%l%l%.exe") then
          mp.set_mpattribute("Lua:Program:Win32/OutBrowse!drop")
        elseif string.match(l_0_3, "^1ab%d+rn%d+%.exe") or string.match(l_0_3, "^1ab%d+rn%d+n2d%.exe") or string.match(l_0_3, "^1agrj%d+%.exe") then
          mp.set_mpattribute("Lua:Adware:Win32/ZoomyLib.B")
        end
      end
    elseif string.match(l_0_1, "\\appdata\\local\\tmp%d+\\") or string.match(l_0_1, "\\local settings\application data\\tmp%d+\\") then
      if 9 < l_0_4 and l_0_4 < 15 and string.match(l_0_3, "^dag%d+%.exe") then
        mp.set_mpattribute("Lua:Adware:Win32/ZoomyLib.A")
      end
    elseif 12 < l_0_4 and l_0_4 < 17 then
      if string.match(l_0_3, "^bb%lcabe%l%l+%.exe") then
        mp.set_mpattribute("Lua:Program:Win32/OutBrowse.A")
      end
    elseif 12 < l_0_4 and l_0_4 < 50 and (string.find(l_0_3, "^lyricsgizm.*%.exe") or string.find(l_0_3, "^webzoom.*%.exe") or string.find(l_0_3, "^zoomify.*%.exe") or string.find(l_0_3, "^zoompic.*%.exe") or string.find(l_0_3, "^zooompic.*%.exe")) then
      mp.set_mpattribute("Lua:Adware:Win32/ZoomyLib.C")
    end
  end
end
return mp.CLEAN
