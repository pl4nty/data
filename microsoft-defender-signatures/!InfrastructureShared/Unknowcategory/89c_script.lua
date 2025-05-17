-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\89c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  do
    if l_0_1 then
      local l_0_2 = (string.lower)(l_0_1)
      if l_0_2:find("frtool.exe", 1, true) then
        return mp.INFECTED
      end
    end
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    do
      if l_0_3 and l_0_4 then
        local l_0_5 = (string.lower)(l_0_4)
        if l_0_5:find("fr_forensic.run.ps1") or l_0_5:find("installplazavcdriver-012121.ps1") then
          return mp.INFECTED
        end
      end
      return mp.CLEAN
    end
  end
end

