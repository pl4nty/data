-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8d5_655.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 then
    l_0_1 = (string.lower)(l_0_1)
    if l_0_1 == "msiexec.exe" then
      local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
      if l_0_2 then
        l_0_2 = (string.lower)(l_0_2)
        if l_0_2:find("^kb[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]?[0-9]?%.exe$") == 1 then
          (mp.set_mpattribute)("Lua:ContextualDropMsiexecKB.A")
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

