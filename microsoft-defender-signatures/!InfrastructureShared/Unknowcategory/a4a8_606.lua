-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a4a8_606.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
do
  if peattributes.ismsil == true and l_0_0 < 20480 then
    local l_0_1 = (pe.get_versioninfo)()
    -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P3

    if (l_0_1.OriginalFilename ~= nil and (l_0_1.OriginalFilename):lower() == "monitor.exe") or l_0_1.InternalName == nil or l_0_1.CompanyName == nil or l_0_1.FileDescription == nil or l_0_1.LegalTrademarks == nil or l_0_1.ProductName ~= nil and (l_0_1.ProductName):lower() == "monitor" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

