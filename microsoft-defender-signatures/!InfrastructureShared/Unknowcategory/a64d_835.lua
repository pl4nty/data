-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a64d_835.luac 

-- params : ...
-- function num : 0
if (mp.IsHipsRuleEnabled)("92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B") then
  local l_0_0 = (mp.getfilename)()
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  local l_0_3 = (string.match)(l_0_0, "(.*)%.(%a+)->%w+/%w+.bin$")
  if l_0_3 == nil or l_0_0 == nil then
    l_0_3 = l_0_0
    local l_0_1, l_0_2 = nil
  else
    do
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

      l_0_3 = l_0_3 .. "." .. l_0_1
      if (mp.get_mpattribute)("ASRWin32ApiMacroExclusion") == true then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

      do
        do
          if l_0_1 == "zip" then
            local l_0_4 = nil
            if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) == nil or (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) == "" then
              return mp.CLEAN
            end
            if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "explorer.exe" then
              return mp.CLEAN
            end
          end
          ;
          (mp.set_mpattribute)("MpDisableCaching")
          ;
          (MpCommon.AppendPersistContext)(l_0_3, "enghipscpy:MHSTRLoadWin32importsfromMacroInside", 0)
          return mp.INFECTED
        end
      end
    end
  end
end

