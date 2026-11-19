-- Threat: !InfrastructureShared
-- Name: !#SCRIPT:Win32/Qakbot.T!lnk
-- Type: 13

if mp.get_mpattribute("SCRIPT:Qakbot.T!lnk") then
  local l_0_0 = string.lower(tostring(headerpage))
  local l_0_1, l_0_2 = string.match(l_0_0, "\\microsoft\\(%a+)\\(%a+)%.exe")
  if l_0_1 and l_0_2 and string.sub(l_0_1, 0, -2) == l_0_2 then
    local l_0_3 = string.match(l_0_0, "(%a:\\%a%a%a%a%a[%a%d%s\\]+\\microsoft\\" .. l_0_1 .. "\\" .. l_0_2 .. "%.exe)")
    if l_0_3 then
      mp.ReportLowfi(l_0_3, 604029456)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
