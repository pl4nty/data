-- Threat: !InfrastructureShared
-- Name: !#Lua:PythonObfuscated.A
-- Type: 13
-- MpAttributes: BM_CONTAINER_FILE & BM_ZLIB_FILE & BRUTE:DllFileExtStringInFooter & BRUTE:ZipFileExtStringInFooter

local l_0_0 = {
  "SCPT:TrojanDownloader:O97M/Encdoc.AVB34!MTB",
  "SCPT:TrojanDownloader:PowerShell/Boxter.EA17!MTB",
  "SCPT:TrojanDownloader:HTML/Obfuse.PVBA4!MTB",
  "SCPT:TrojanDownloader:O97M/Zloader.STO",
  "SCPT:Trojan:HTML/ScriptPyExecution.X6",
  "SCPT:Trojan:Win32/Malusblnkcmd.A"
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  local l_0_4 = mp.enum_mpattributesubstring(l_0_3)
  if l_0_4 ~= nil then
    l_0_1 = l_0_1 + 1
    if 4 <= l_0_1 then
      mp.set_mpattribute("Lua:PythonObfuscated")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
