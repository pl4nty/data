-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e3b300c671c7\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_0 = (string.lower)(l_0_0)
end
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  return mp.CLEAN
end
local l_0_1 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 then
  l_0_1 = (this_sigattrlog[2]).utf8p1
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 then
    l_0_1 = (this_sigattrlog[3]).utf8p1
  end
end
if not isnull(l_0_1) and l_0_1:find("imagepath:", 1, true) then
  l_0_1 = (string.match)(l_0_1, "imagepath:(%w.*)")
  if not isnull(l_0_1) then
    local l_0_2 = l_0_1:match("^(.+)\\")
    local l_0_3 = l_0_2 .. "\\attack.yml"
    if (sysio.IsFileExists)(l_0_3) then
      local l_0_4 = (sysio.GetFileSize)(l_0_3)
      if l_0_4 > 1000 and l_0_4 < 30000 then
        local l_0_5 = (sysio.ReadFile)(l_0_3, 0, l_0_4)
        if l_0_5 then
          local l_0_6 = false
          local l_0_7 = {}
          local l_0_8 = {}
          l_0_8.n = "c2NlbmFyaW9fbmFtZTooLi0pCg=="
          l_0_8.i = "c2NlbmFyaW9faWQ6KC4tKQo="
          for l_0_12,l_0_13 in pairs(l_0_8) do
            l_0_13 = (MpCommon.Base64Decode)(l_0_13)
            local l_0_14 = (string.match)(l_0_5, l_0_13)
            if l_0_14 then
              l_0_14 = l_0_14:lower()
              l_0_14 = (l_0_14:gsub("^%s+", "")):gsub("%s+$", "")
              l_0_7[l_0_12] = l_0_14
              local l_0_15 = l_0_12 .. "scrubbed"
              l_0_7[l_0_15] = scrubData(l_0_14)
              l_0_6 = true
            end
          end
          if l_0_6 == true then
            local l_0_16 = (MpCommon.Base64Encode)(safeJsonSerialize(l_0_7))
            reportTimingData()
            ;
            (bm.add_related_string)("epaiq", l_0_16, bm.RelatedStringBMReport)
            ;
            (bm.add_related_file)(l_0_3)
            return mp.INFECTED
          end
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

