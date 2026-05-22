-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28d7da07d395\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) then
  local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if not isnull(l_0_1) then
    do
      if not (string.match)(l_0_1, "%-EncodedCommand%s+([A-Za-z0-9+/=]+)") then
        local l_0_2, l_0_3 = (string.match)(l_0_1, "%-Enc%s+([A-Za-z0-9+/=]+)")
      end
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

      if l_0_2 == nil then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

      local l_0_4 = nil
      if (MpCommon.Base64Decode)(l_0_2) == nil then
        return mp.CLEAN
      end
      do
        local l_0_5 = (string.lower)((MpCommon.Base64Decode)(l_0_2))
        if contains(l_0_5, {"invoke-webrequest", "invoke-expression", "| invoke-expression", "|iex", "| iex", "iwr "}) then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

