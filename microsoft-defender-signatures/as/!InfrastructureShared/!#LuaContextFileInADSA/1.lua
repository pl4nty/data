-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/FileInADS.A
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and #l_0_0 < 2 then
  return mp.CLEAN
end
local l_0_1 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_1) and string.find(l_0_0, "->", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_0, ":", 1, true)
if l_0_2 ~= nil then
  local l_0_3 = string.sub(l_0_0, l_0_2 + 1, #l_0_0)
  if l_0_3 ~= nil and 0 < #l_0_3 then
    local l_0_4 = {
      ["zone.identifier"] = "zi",
      ["zone.identifier:$data"] = "zid",
      tamper = "tamper",
      favicon = "favicon",
      oestandardproperty = "oesp",
      knownsources = "knownsources",
      rvcontext = "rvcontext",
      ["com.dropbox.attributes"] = "dropboxattr",
      ["com.dropbox.attrs"] = "dropboxattrs",
      ["com.dropbox.internal"] = "dropboxinternal",
      ["com.amazon.drive.sync"] = "awsdrivesync",
      ["com.apple.lastuseddate#ps"] = "apple_sync",
      mbinfo = "mbinfo",
      afp_afpinfo = "acronisinfo",
      ["fsrm{ef88c031-5950-4164-ab92-eec5f16005a5}"] = "ms_fsrm",
      x5zn8agxs4 = "avast_data",
      ["6e53bff5-0001-412b-8407-e3aede763511"] = "diagtrack_agent",
      ["incompletestartprocessprotection.cnt"] = "avast_data2",
      versioncache = "sharedfiles",
      apcacheheader = "apcacheheader",
      databusdeliverylog = "databusdeliverylog",
      wofcompresseddata = "wofcompresseddata",
      ["&#x05;summaryinformation"] = "summaryinformation",
      ["&#x05;documentsummaryinformation"] = "summaryinformation",
      ["gbpkmap.lst"] = "gbpkmap",
      dlpfac = "dlpfac",
      ca_inoculateit = "ca_inoculateit",
      ["jdnfile.identifier"] = "jdnfile",
      SmartScreen = "SmartScreen"
    }
    local l_0_5 = l_0_4[l_0_3]
    if l_0_5 ~= nil then
      mp.set_mpattribute("Lua:Context/FileInADS.A!commonadslist")
      mp.set_mpattribute("Lua:Context/FileInADS.A!" .. l_0_5)
    end
    local l_0_6 = string.sub(l_0_0, 0, l_0_2)
    if l_0_6 ~= nil and 5 < #l_0_6 then
      local l_0_7 = {
        ["cngsvc.exe:"] = "countertack"
      }
      local l_0_8 = l_0_7[l_0_6]
      if l_0_8 ~= nil then
        mp.set_mpattribute("Lua:Context/FileInADS.A!commonadslist")
        mp.set_mpattribute("Lua:Context/FileInADS.A!" .. l_0_8)
      end
      if l_0_6 == "system32:" and 40 <= #l_0_3 and string.sub(l_0_3, 0, 1) == "$" then
        mp.set_mpattribute("Lua:Context/FileInADS.A!commoninwindir")
      end
    end
    if mp.get_mpattribute("BM_MZ_FILE") then
      mp.set_mpattribute("Lua:Context/PeFileInADS.A")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
