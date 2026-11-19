-- Threat: !InfrastructureShared
-- Name: MpTamperPPL
-- Type: 15

local l_0_0 = Remediation.Threat.Name
local l_0_1 = {
  ["hkcu\\software\\classes\\typelib\\{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}"] = true,
  ["hkcu\\software\\classes\\wow6432node\\typelib\\{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}"] = true,
  ["hkcu\\software\\classes\\typelib\\{57dacae6-5313-4e27-b109-e6e3d415730c}"] = true,
  ["hkcu\\software\\classes\\wow6432node\\typelib\\{57dacae6-5313-4e27-b109-e6e3d415730c}"] = true,
  ["hkcu\\software\\classes\\typelib\\{a87f050d-3ffd-4682-8e77-34e530624cb4}"] = true,
  ["hkcu\\software\\classes\\wow6432node\\typelib\\{a87f050d-3ffd-4682-8e77-34e530624cb4}"] = true,
  ["hkcu\\software\\classes\\typelib\\{c0653e9c-db3b-4e9e-b3ab-b8e1df53972f}"] = true,
  ["hkcu\\software\\classes\\wow6432node\\typelib\\{c0653e9c-db3b-4e9e-b3ab-b8e1df53972f}"] = true,
  ["hkcu\\software\\classes\\typelib\\{7071ec00-663b-4bc1-a1fa-b97f3b917c55}"] = true,
  ["hkcu\\software\\classes\\wow6432node\\typelib\\{7071ec00-663b-4bc1-a1fa-b97f3b917c55}"] = true
}
if string.find(l_0_0, "MpTamperPPL.B", 1, true) then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = sysio.RegExpandUserKey(l_0_2)
    for l_0_5, l_0_6 in pairs(l_0_4) do
      local l_0_7 = sysio.RegOpenKey(l_0_6)
      if l_0_7 ~= nil then
        local l_0_8, l_0_9 = pcall(sysio.DeleteRegKey, l_0_7, "")
        l_0_8 = l_0_8 or pcall(Remediation.BtrDeleteRegKey, l_0_6)
      end
    end
  end
end
