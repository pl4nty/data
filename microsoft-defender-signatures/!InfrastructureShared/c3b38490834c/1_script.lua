-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c3b38490834c\1_luac 

-- params : ...
-- function num : 0
local l_0_2 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched then
  if (string.find)((this_sigattrlog[1]).utf8p2, "{.-}", 1, false) and tostring((this_sigattrlog[1]).utf8p2) ~= tostring((this_sigattrlog[2]).utf8p2) then
    local l_0_0 = nil
    l_0_0 = "old_value_mismatch" .. "TypeLib"
    local l_0_1 = {}
    l_0_1.CLSID_From = (this_sigattrlog[1]).utf8p2
    l_0_1.CLSID_To = (this_sigattrlog[2]).utf8p2
  else
    do
      if (string.find)((this_sigattrlog[2]).utf8p1, "HKCU\\", 1, true) then
        local l_0_3 = nil
        local l_0_4 = nil
        -- DECOMPILER ERROR at PC79: Overwrote pending register: R0 in 'AssignReg'

        if GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "") and GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "") ~= tostring((this_sigattrlog[2]).utf8p2) then
          l_0_3 = "hklm_hkcu_mismatch" .. "TypeLib"
          l_0_4.CLSID_From = GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "")
          l_0_4.CLSID_To = (this_sigattrlog[2]).utf8p2
        end
      end
      do
        -- DECOMPILER ERROR at PC92: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC92: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2 then
          l_0_4.parents = add_parents()
          -- DECOMPILER ERROR at PC96: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC96: Confused about usage of register: R2 in 'UnsetPending'

          l_0_4.processname = (bm.get_imagepath)()
          -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC97: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC97: Confused about usage of register: R2 in 'UnsetPending'

          l_0_4.reason = l_0_3
          -- DECOMPILER ERROR at PC105: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC105: Confused about usage of register: R2 in 'UnsetPending'

          l_0_4.appId = (string.match)((this_sigattrlog[2]).utf8p1, "({.-})")
          -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

          do
            local l_0_5, l_0_6, l_0_7, l_0_8 = , safeJsonSerialize(l_0_4) or l_0_4.processname or ""
            -- DECOMPILER ERROR at PC119: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC121: Confused about usage of register: R3 in 'UnsetPending'

            AppendToRollingQueue("Potential_COM_Hijacked_CLSIDs", (string.lower)(l_0_6.CLSID_To), l_0_7, 1800, 100, 0)
            -- DECOMPILER ERROR at PC129: Confused about usage of register: R3 in 'UnsetPending'

            ;
            (bm.add_related_string)("AdditionalInfo", l_0_7, bm.RelatedStringBMReport)
            do return mp.INFECTED end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

