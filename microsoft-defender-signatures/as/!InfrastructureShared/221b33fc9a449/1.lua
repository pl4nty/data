-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\221b33fc9a449\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if not (this_sigattrlog[3]).utf8p2 then
  local l_0_3 = nil
  local l_0_4 = {}
  if (tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", "") == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R4 in 'UnsetPending'

  if not (string.find)((tostring(not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched or "")):gsub("[\128-\255]", ""), "{.-}", 1, false) or not (string.find)((tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", ""), "{.-}", 1, false) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC63: Confused about usage of register: R3 in 'UnsetPending'

  if (tostring(not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched or "")):gsub("[\128-\255]", "") ~= (tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", "") then
    l_0_2 = true
    l_0_3 = "old_value_mismatch" .. "TreatAs"
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R3 in 'UnsetPending'

    l_0_4.CLSID_From = (tostring(not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched or "")):gsub("[\128-\255]", "")
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

    l_0_4.CLSID_To = (tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", "")
  else
    if (string.find)((this_sigattrlog[4]).utf8p1, "HKCU\\", 1, true) then
      local l_0_5 = nil
      local l_0_6 = nil
      if not (string.find)(l_0_5, "{.-}", 1, false) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC116: Confused about usage of register: R6 in 'UnsetPending'

      -- DECOMPILER ERROR at PC123: Confused about usage of register: R6 in 'UnsetPending'

      if (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") and (string.find)((GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", ""), "{.-}", 1, false) and (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") ~= l_0_6 then
        l_0_2 = true
        l_0_3 = "hklm_hkcu_mismatch" .. "TreatAs"
        -- DECOMPILER ERROR at PC129: Confused about usage of register: R6 in 'UnsetPending'

        l_0_4.CLSID_From = (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "")
        l_0_4.CLSID_To = l_0_6
      end
    end
  end
  do
    if l_0_2 then
      l_0_4.parents = add_parents()
      l_0_4.processname = (bm.get_imagepath)()
      l_0_4.reason = l_0_3
      l_0_4.appId = (string.match)((this_sigattrlog[4]).utf8p1, "({.-})")
      do
        do
          local l_0_7, l_0_8, l_0_9, l_0_10 = , safeJsonSerialize(l_0_4) or l_0_4.processname or ""
          -- DECOMPILER ERROR at PC164: Confused about usage of register: R5 in 'UnsetPending'

          AppendToRollingQueue("Potential_COM_Hijacked_CLSIDs", (string.lower)(l_0_4.CLSID_To), l_0_9, 1800, 100, 0)
          -- DECOMPILER ERROR at PC172: Confused about usage of register: R5 in 'UnsetPending'

          ;
          (bm.add_related_string)("AdditionalInfo", l_0_9, bm.RelatedStringBMReport)
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

