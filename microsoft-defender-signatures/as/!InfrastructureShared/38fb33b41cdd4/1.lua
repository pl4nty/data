-- Threat: !InfrastructureShared
-- Name: 38fb33b41cdd4
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched then
  l_0_1 = string.lower(this_sigattrlog[8].utf8p1)
end
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[10].utf8p2)
end
if l_0_2 then
  local l_0_3 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  if l_0_3 then
    local l_0_4 = string.match(l_0_3, "Uri=([^;]+)")
    if isnull(l_0_4) then
      return mp.CLEAN
    end
    local l_0_5 = {}
    l_0_5.SIG_CONTEXT = "BM"
    l_0_5.CONTENT_SOURCE = "IRL_ALLOCVMREMOTE_SETTHREADCONTEXT"
    if string.match(l_0_4, "^https?://") then
      local l_0_6, l_0_7 = mp.CheckUrl(l_0_4)
      if l_0_6 == 1 and l_0_7 == 1 then
        return mp.CLEAN
      end
      local l_0_8 = SafeGetUrlReputation({l_0_4}, l_0_5, false, 3000)
      if l_0_8.urls[l_0_4] and l_0_8.urls[l_0_4].determination == 2 and l_0_8.urls[l_0_4].confidence >= 60 then
        local l_0_9, l_0_10 = pcall(string.match, l_0_2, "vmbaseaddress:(%d+)")
        if not l_0_9 or isnull(l_0_10) then
          return mp.CLEAN
        end
        local l_0_11, l_0_12 = pcall(string.match, l_0_2, "vmbytescopied:(%d+)")
        if not l_0_11 or isnull(l_0_12) then
          return mp.CLEAN
        end
        local l_0_13, l_0_14
        local l_0_15 = versioning.GetProcessorArchitecture()
        if l_0_15 == 0 then
          l_0_13 = l_0_1
          l_0_14 = "32"
        elseif l_0_15 == 9 then
          if this_sigattrlog[7].matched then
            l_0_13 = l_0_0
            l_0_14 = "32"
          elseif this_sigattrlog[8].matched then
            l_0_13 = l_0_1
            l_0_14 = "64"
          end
        end
        if l_0_13 then
          local l_0_16, l_0_17 = pcall(sysio.GetPEVersionInfo, l_0_13)
          if not l_0_16 or isnull(l_0_17) then
            return mp.CLEAN
          end
          local l_0_18 = l_0_17.OriginalFilename
          local l_0_19 = l_0_17.ProductVersion
          local l_0_20 = l_0_17.FileVersion
          if isnull(l_0_18) or isnull(l_0_19) or isnull(l_0_20) then
            return mp.CLEAN
          end
          local l_0_21 = {
            product_version = l_0_19,
            file_version = l_0_20,
            arch_str = l_0_14,
            sizeof_shellcode = l_0_12,
            address_of_shellcode = l_0_10,
            dest_url = l_0_4
          }
          bm.set_detection_string(safeJsonSerialize(l_0_21))
          bm.add_related_string("PRODUCT VERSION: ", l_0_19, bm.RelatedStringBMReport)
          bm.add_related_string("FILE VERSION: ", l_0_20, bm.RelatedStringBMReport)
          bm.add_related_string("ARCH: ", l_0_14, bm.RelatedStringBMReport)
        end
        bm.add_related_string("SHELLCODE BYTES: ", l_0_12, bm.RelatedStringBMReport)
        bm.add_related_string("SHELLCODE ADDRESS: ", l_0_10, bm.RelatedStringBMReport)
        bm.add_related_string("MALICIOUS URL: ", l_0_4, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
