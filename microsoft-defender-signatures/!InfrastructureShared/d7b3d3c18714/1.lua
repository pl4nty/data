-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d7b3d3c18714\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched then
  local l_0_3 = nil
  if not (string.find)((string.lower)((this_sigattrlog[1]).utf8p2), "http", 1, true) then
    return mp.CLEAN
  end
  if (this_sigattrlog[1]).utf8p2 ~= (this_sigattrlog[2]).utf8p2 then
    local l_0_4, l_0_5 = {}
    if UrlGrader((this_sigattrlog[2]).utf8p2, "Behavior:Win32/COMHijacking.D", false) ~= 0 then
      l_0_4.URL_Grading_Info = (this_sigattrlog[2]).utf8p2
    end
    l_0_2 = true
    l_0_3 = "old_value_mismatch" .. "ScriptletUrl"
    l_0_4.old_url = (this_sigattrlog[1]).utf8p2
    l_0_4.new_url = (this_sigattrlog[2]).utf8p2
  else
    do
      if (string.find)((this_sigattrlog[2]).utf8p1, "HKCU\\", 1, true) then
        local l_0_6 = nil
        local l_0_7 = nil
        if GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "") and GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "") ~= (this_sigattrlog[2]).utf8p2 then
          l_0_2 = true
          l_0_3 = "hklm_hkcu_mismatch" .. "ScriptletUrl"
          l_0_6.hklm_url = GetRegistryValue((string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\"), "")
          l_0_6.hkcu_url = (this_sigattrlog[2]).utf8p2
        end
      end
      do
        -- DECOMPILER ERROR at PC103: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC103: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2 then
          l_0_6.parents = add_parents()
          -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

          l_0_6.processname = (bm.get_imagepath)()
          -- DECOMPILER ERROR at PC108: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC108: Confused about usage of register: R2 in 'UnsetPending'

          l_0_6.reason = l_0_3
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

          l_0_6.appId = (string.match)((this_sigattrlog[2]).utf8p1, "({.-})")
          -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC122: Confused about usage of register: R2 in 'UnsetPending'

          do
            do
              local l_0_8, l_0_9 = nil
              ;
              (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_6) or l_0_6.processname or "", bm.RelatedStringBMReport)
              do return mp.INFECTED end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

