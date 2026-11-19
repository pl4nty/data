-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Hullert.A!dha
-- Type: 10

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.CompanyName
  local l_0_2 = l_0_0.ProductName
  local l_0_3 = {
    ["Check Update"] = "",
    cas = "",
    errorcheck = "",
    smss = "",
    twain_64 = "",
    w32srv = "",
    w32upd = ""
  }
  if l_0_1 == "Hewlett-Packard Company" and l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
