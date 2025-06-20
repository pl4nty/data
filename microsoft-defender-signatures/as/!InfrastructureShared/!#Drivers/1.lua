-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#Drivers\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isdriver then
  return mp.CLEAN
end
if peattributes.no_security == true then
  (mp.set_mpattribute)("BM_ESRP:Lua:UnsignedDriver")
  return mp.CLEAN
end
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 ~= nil and l_0_0.OriginalFilename ~= nil then
  do
    if ((l_0_0.OriginalFilename):lower()):match("(.+)%.") == nil then
      local l_0_1 = (l_0_0.OriginalFilename):lower()
    end
    local l_0_2 = nil
    local l_0_3 = false
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

    if (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)) ~= nil and (string.sub)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), 0, -5) ~= nil and (string.find)((string.sub)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), 0, -5), l_0_2, 1, true) == nil then
      (mp.set_mpattribute)("BM_ESRP:Lua:RenamedSignedDriver")
      l_0_3 = true
    end
    if l_0_3 == false then
      (mp.set_mpattribute)("BM_ESRP:Lua:VersionedSignedDriver")
    end
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC140: Confused about usage of register: R4 in 'UnsetPending'

    if ({aiwsys = "Aiwsys", bandai = "Bandai", capcom = "Capcom", cpuz = "Cpuz", elbycdio = "Elbycdio", goad = "Goad", initdrv = "Initdrv", jtaxdfgznc = "Jtaxdfgznc", kmclass_x64 = "Kmclass_x64", libnicm = "Libnicm", nicm = "Nicm", nscm = "Nscm", rwdrv = "Rwdrv", termdd = "Termdd", tlsdrivegtw = "Tlsdrivegtw", vboxdrv = "Vboxdrv", xueman3 = "Xueman3", HwOs2Ec = "HwOs2Ec", phymem = "Phymem", asrdrv = "AsrDrv", atillk64 = "AtiLlk", bs_hwmio64_w10 = "BS_HWMIO64_W10", bs_i2cio = "BS_I2c64", bsmi = "BSMIx64", ucorew64 = "Ucorew64", ucoresys = "Ucoresys", amifldrv64 = "amifldrv64", glckio2 = "GLCKIO2", gvcidrv = "GVCIDrv", gdrv = "GDrv", gvcidrv64 = "GVCIDrv64", segwindrv = "segwindrv", segwindrvx64 = "segwindrvx64", msio64 = "MSIO64", ntiolib_x64 = "NTIOLib_X64", ntiolib = "NTIOLib", nbiolib_x64 = "NBIOLib_X64", nbiolib = "NBIOLib", winring0x64 = "WinRing0x64", winring0 = "WinRing0", modapi = "MODAPI", nvflash = "NvFlash", rtkio64 = "rtkio64", rtkio86 = "rtkio86", rtkiow8x86 = "rtkiow8x86", rtkiow8x64 = "rtkiow8x64", rtkiow10x86 = "rtkiow10x86", rtkiow10x64 = "rtkiow10x64", speedfan = "speedfan", sfdrvx32 = "speedfan", sfdrvx64 = "speedfan", kevp64 = "powertool", amdryzenmasterdriver = "amdryzenmaster"})[l_0_2] ~= nil then
      (mp.set_mpattribute)("BM_ESRP:Lua:" .. ({aiwsys = "Aiwsys", bandai = "Bandai", capcom = "Capcom", cpuz = "Cpuz", elbycdio = "Elbycdio", goad = "Goad", initdrv = "Initdrv", jtaxdfgznc = "Jtaxdfgznc", kmclass_x64 = "Kmclass_x64", libnicm = "Libnicm", nicm = "Nicm", nscm = "Nscm", rwdrv = "Rwdrv", termdd = "Termdd", tlsdrivegtw = "Tlsdrivegtw", vboxdrv = "Vboxdrv", xueman3 = "Xueman3", HwOs2Ec = "HwOs2Ec", phymem = "Phymem", asrdrv = "AsrDrv", atillk64 = "AtiLlk", bs_hwmio64_w10 = "BS_HWMIO64_W10", bs_i2cio = "BS_I2c64", bsmi = "BSMIx64", ucorew64 = "Ucorew64", ucoresys = "Ucoresys", amifldrv64 = "amifldrv64", glckio2 = "GLCKIO2", gvcidrv = "GVCIDrv", gdrv = "GDrv", gvcidrv64 = "GVCIDrv64", segwindrv = "segwindrv", segwindrvx64 = "segwindrvx64", msio64 = "MSIO64", ntiolib_x64 = "NTIOLib_X64", ntiolib = "NTIOLib", nbiolib_x64 = "NBIOLib_X64", nbiolib = "NBIOLib", winring0x64 = "WinRing0x64", winring0 = "WinRing0", modapi = "MODAPI", nvflash = "NvFlash", rtkio64 = "rtkio64", rtkio86 = "rtkio86", rtkiow8x86 = "rtkiow8x86", rtkiow8x64 = "rtkiow8x64", rtkiow10x86 = "rtkiow10x86", rtkiow10x64 = "rtkiow10x64", speedfan = "speedfan", sfdrvx32 = "speedfan", sfdrvx64 = "speedfan", kevp64 = "powertool", amdryzenmasterdriver = "amdryzenmaster"})[l_0_2])
    end
    local l_0_5 = nil
    local l_0_6 = nil
    if ((pe.get_fixedversioninfo)()).FileVersion ~= nil then
      local l_0_7 = nil
      local l_0_8 = {}
      l_0_8.cpuz = {"cpuz_asr_driver", 0, 2.814749769728e+14}
      l_0_8.elbycdio = {"elby_asr_driver", 0, 1.6888498604605e+15}
      l_0_8.libnicm = {"libnicm_asr_driver", 0, 8.4442922582016e+14}
      l_0_8.mtcbsv64 = {"mtcbsv64_asr_driver", 0, 5.9109831008584e+15}
      l_0_8.nicm = {"nicm_asr_driver", 0, 8.4442922582016e+14}
      l_0_8.nscm = {"nscm_asr_driver", 0, 8.4442922582016e+14}
      l_0_8.sandra = {"sandra_asr_driver", 0, 2.8148013067141e+15}
      l_0_8.rtkio64 = {"rtkio64_asr_driver", 0, 0}
      l_0_8.rtkiow10x64 = {"rtkiow10x64_asr_driver", 0, 0}
      l_0_8.rtkiow8x64 = {"rtkiow8x64_asr_driver", 0, 0}
      l_0_8.bsmi = {"bsmi_asr_driver", 0, 2.8147497671066e+14}
      l_0_8.bs_hwmio64_w10 = {"bs_hwmio64_asr_driver", 0, 2.8147498855158e+15}
      l_0_8.bs_i2cio = {"biostar_io_asr_driver", 0, 2.8147927167795e+14}
      l_0_8.ntiolib = {"ntiolib_asr_driver", 0, 2.8147497671066e+14}
      l_0_8.nchgbios2x64 = {"nchgbios2x64_asr_driver", 0, 1.1259084970394e+15}
      l_0_8.segwindrvx64 = {"segwindrvx64_asr_driver", 0, 2.8147497671524e+16}
      l_0_8.gdrv = {"gdrv_asr_driver", 0, 0}
      l_0_8["kernel-bridge"] = {"kernelbridge_asr_driver", 0, 0}
      l_0_8.rwdrv = {"rwdrv_asr_driver", 0, 0}
      l_0_8.speedfan = {"speedfan_asr_driver", 0, 0}
      l_0_8.sfdrvx32 = {"speedfan_asr_driver", 0, 0}
      l_0_8.sfdrvx64 = {"speedfan_asr_driver", 0, 0}
      l_0_8.kevp64 = {"powertoolx64_asr_driver", 0, 0}
      l_0_8.amdryzenmasterdriver = {"amdryzenmaster_asr_driver", 0, 2.8149645154714e+14}
      l_0_8.viragt = {"viragt_asr_driver", 0, 2.8181857409434e+14}
      l_0_8.viragt64 = {"viragt64_asr_driver", 0, 2.8147497671068e+14}
      l_0_8.kprocesshacker = {"processhacker_asr_driver", 0, 0}
      l_0_8.physmem = {"physicalmem_asr_driver", 0, 0}
      l_0_8.phymem = {"phymem_asr_driver", 0, 0}
      l_0_8.amp = {"sm_amp_asr_driver", 0, 0}
      l_0_8.iqvw64 = {"iqvw64_asr_driver", 0, 2.8149215657986e+14}
      l_0_8.winring0 = {"winring0_asr_driver", 0, 0}
      l_0_8.hpportiox64 = {"hpportiox64_asr_driver", 0, 0}
      l_0_8.lha = {"lha_asr_driver", 0, 0}
      l_0_8.gmer64 = {"gmer_asr_driver", 0, 0}
      l_0_8.pchunter = {"pchunter_asr_driver", 0, 0}
      l_0_8.tvichw64 = {"tvicp_asr_driver", 0, 0}
      l_0_8.tvicport = {"tvicf_asr_driver", 0, 0}
      l_0_8.ssport = {"ssport_asr_driver", 2.8147497671066e+14, 2.8147497671066e+14}
      l_0_8.vmdrv = {"vmdrv_asr_driver", 0, 0}
      l_0_8.aswarpot = {"aswarpot_asr_driver", 0, 5.9109959857603e+15}
      l_0_8.bs_rcio64 = {"bs_rcio64_asr_driver", 0, 0}
      l_0_8.atszio = {"atszio_asr_driver", 0, 8590000135}
      l_0_8.lgcoretemp = {"lgcoretemp_asr_driver", 0, 2.8147497671066e+14}
      l_0_8.sandbox = {"agsandbox_asr_driver", 0, 0}
      l_0_8.amdpowerprofiler = {"amdpowerprofiler_asr_driver", 1.6888498602639e+15, 1.6888541552312e+15}
      l_0_8.aswsnx = {"aswsnx_asr_driver", 0, 4.7850831940157e+15}
      l_0_8.asrdrv = {"asrdrv_asr_driver", 0, 0}
      l_0_8.hwos2ec = {"hwos2ec_asr_driver", 0, 2.8147497671066e+14}
      l_0_8.bs_def64 = {"bsdef64_asr_driver", 0, 0}
      l_0_8.lenovodiagnosticsdriver = {"lenovodiag_asr_driver", 0, 5.6294995342131e+14}
      l_0_8.superbmc = {"superbmc_asr_driver", 0, 5.6294995342131e+14}
      l_0_8.procexp = {"procexp_asr_driver", 0, 4.7850746040812e+15}
      l_0_8.iobitunlocker = {"iobitunlocker_asr_driver", 0, 0}
      l_0_8.agent64 = {"agent64_asr_driver", 0, 0}
      l_0_8.nvflash = {"nvflash_asr_driver", 0, 2.8151363141632e+14}
      l_0_8.inpoutx64 = {"inpoutx64_asr_driver", 0, 0}
      l_0_8.alsysio = {"alsysio_asr_driver", 0, 5.6294995401114e+14}
      l_0_8.atillk64 = {"atillk64_asr_driver", 0, 0}
      l_0_8.hw = {"hw_asr_driver", 0, 0}
      l_0_8.wiseunlo = {"wiseunlo_asr_driver", 0, 0}
      l_0_8.klmd = {"klmd_asr_driver", 0, 5.6300578799617e+14}
      l_0_8.tmel = {"tmel_asr_driver", 0, 2.8150074651544e+14}
      l_0_8.lv561v64 = {"lv561v64_asr_driver", 0, 0}
      l_0_8.symelam = {"symelam_asr_driver", 0, 5.6296713329058e+14}
      local l_0_9 = "hwrwdrv"
      l_0_8[l_0_9] = {"hwrwdrv_asr_driver", 0, 0}
      l_0_9 = "monitor"
      l_0_8[l_0_9] = {"monitor_asr_driver", 0, 2.8148356664526e+14}
      l_0_9 = "otipcibus64"
      l_0_8[l_0_9] = {"otipcibus64_asr_driver", 0, 0}
      l_0_9 = "asrsetupdrv103"
      l_0_8[l_0_9] = {"asrsetupdrv_asr_driver", 0, 0}
      l_0_9 = "hardwarering0"
      l_0_8[l_0_9] = {"hwring0_asr_driver", 0, 0}
      l_0_9 = "mydrivers"
      l_0_8[l_0_9] = {"dghwmonitor_asr_driver", 0, 0}
      l_0_9 = "driver7"
      l_0_8[l_0_9] = {"ectool_asr_driver", 0, 0}
      l_0_9 = "iuforcedelete"
      l_0_8[l_0_9] = {"iuforcedelete_asr_driver", 0, 0}
      l_0_9 = "aswelam"
      l_0_8[l_0_9] = {"avgelam_asr_driver", 0, 6.1924752837181e+15}
      l_0_9 = "avgelam"
      l_0_8[l_0_9] = {"avgelam_asr_driver", 0, 6.1924752837181e+15}
      l_0_9 = "eelam"
      l_0_8[l_0_9] = {"eelam_asr_driver", 0, 2.8147497681551e+15}
      l_0_9 = "rzpnk"
      l_0_8[l_0_9] = {"rzpnk_asr_driver", 0, 0}
      l_0_9 = "hwinfo64a"
      l_0_8[l_0_9] = {"hwinfo_asr_driver", 0, 2.2532515126313e+15}
      l_0_9 = "hwinfo64i"
      l_0_8[l_0_9] = {"hwinfo_asr_driver", 0, 2.2532515126313e+15}
      l_0_9 = "eio"
      l_0_8[l_0_9] = {"eio_asr_driver", 0, 0}
      l_0_9 = "bsmem64_w10"
      l_0_8[l_0_9] = {"bsmiw10_asr_driver", 0, 0}
      l_0_9 = "aswsp"
      l_0_8[l_0_9] = {"aswsp_asr_driver", 0, 5.6295338939515e+15}
      l_0_9 = "ctiio64"
      l_0_8[l_0_9] = {"ctiio64_asr_driver", 0, 2.8147927318568e+14}
      l_0_8.msio64, l_0_9 = l_0_9, {"msio64_asr_driver", 0, 2.8148786312028e+14}
      l_0_9 = "msio32"
      l_0_8[l_0_9] = {"msio32_asr_driver", 0, 2.8148786312028e+14}
      l_0_9 = "pcdsrvc"
      l_0_8[l_0_9] = {"pcdsrvc_asr_driver", 0, 1.6888627451658e+15}
      l_0_9 = "corsair ll access"
      l_0_8[l_0_9] = {"corsairllaccess_asr_driver", 0, 2.8147497828352e+14}
      l_0_9 = "openlibsys"
      l_0_8[l_0_9] = {"openlibsys_asr_driver", 0, 0}
      l_0_9 = "sysdrv3s"
      l_0_8[l_0_9] = {"sysdrv3s_asr_driver", 0, 8.4445069993574e+14}
      l_0_9 = "iomem"
      l_0_8[l_0_9] = {"iomem_asr_driver", 5.629585433559e+14, 5.629628383232e+14}
      l_0_9 = "etdsupp"
      l_0_8[l_0_9] = {"etdsupport_asr_driver", 0, 0}
      l_0_9 = "athr"
      l_0_8[l_0_9] = {"qcamain10x64_asr_driver", 3.3776997205279e+15, 3.3776997205287e+15}
      l_0_9 = "truesight"
      l_0_8[l_0_9] = {"truesight_asr_driver", 0, 8.4443781503386e+14}
      l_0_9 = "nvoclock"
      l_0_8[l_0_9] = {"nvoclock_asr_driver", 0, 0}
      l_0_9 = "ashitio_drv"
      l_0_8[l_0_9] = {"ashitio_asr_driver", 0, 7.5998243711877e+15}
      l_0_9 = "iomap"
      l_0_8[l_0_9] = {"iomap_asr_driver", 0, 8.4442493013197e+14}
      l_0_9 = "atlaccess"
      l_0_8[l_0_9] = {"atlaccess_asr_driver", 0, 0}
      l_0_9 = "computerz"
      l_0_8[l_0_9] = {"computerz_asr_driver", 0, 0}
      l_0_9 = "vdbsv64"
      l_0_8[l_0_9] = {"vdbsv64_asr_driver", 0, 0}
      l_0_9 = "cp2x72c"
      l_0_8[l_0_9] = {"cp2x72c_asr_driver", 0, 0}
      l_0_9 = "wirwadrv"
      l_0_8[l_0_9] = {"wirwadrv_asr_driver", 0, 0}
      l_0_9 = "cg6kwin2k"
      l_0_8[l_0_9] = {"cg6kwin2k_asr_driver", 0, 0}
      l_0_9 = "gdrv3"
      l_0_8[l_0_9] = {"gdrv3_asr_driver", 0, 2.8147927167796e+14}
      l_0_9 = "sbiosio64"
      l_0_8[l_0_9] = {"sbiosio64_asr_driver", 0, 0}
      l_0_9 = "ngiodriver"
      l_0_8[l_0_9] = {"ngiodriver_asr_driver", 0, 0}
      l_0_9 = "stdcdrv64"
      l_0_8[l_0_9] = {"stdcdrv64_asr_driver", 0, 0}
      l_0_9 = "stdcdrvws64"
      l_0_8[l_0_9] = {"stdcdrvws64_asr_driver", 0, 0}
      l_0_9 = "rtif"
      l_0_8[l_0_9] = {"rtif_asr_driver", 0, 0}
      l_0_9 = "fpcie2com"
      l_0_8[l_0_9] = {"fpcie2com_asr_driver", 0, 0}
      l_0_9 = "rtport"
      l_0_8[l_0_9] = {"rtport_asr_driver", 0, 0}
      l_0_9 = "pdfwkrnl"
      l_0_8[l_0_9] = {"pdfwkrnl_asr_driver", 0, 0}
      l_0_9 = "avalueio"
      l_0_8[l_0_9] = {"avalueio_asr_driver", 0, 0}
      l_0_9 = "hwdetectng"
      l_0_8[l_0_9] = {"hwdetectng_asr_driver", 0, 0}
      l_0_9 = "appid"
      local l_0_10 = {}
      local l_0_11 = "appid_asr_driver"
      local l_0_12 = 0
      local l_0_13 = 0
      local l_0_14 = "exclusion"
      l_0_10[l_0_14] = {"dismhost.exe", "tiworker.exe", "cbss.exe"}
      l_0_14 = "multi_version"
      l_0_10[l_0_14] = {2.8147512502518e+15, 2.8147512502549e+15, 2.8147514315899e+15, 2.8147514315906e+15, 2.8147512495964e+15, 2.8147512495996e+15, 2.8147512088986e+15, 2.8147512089013e+15, 2.8147511006331e+15, 2.8147511006354e+15, 2.8147510151741e+15, 2.8147510151782e+15, 2.8147510152397e+15, 2.8147510152437e+15, 2.8147509312225e+15, 2.814750931228e+15}
      -- DECOMPILER ERROR at PC907: No list found for R9 , SetList fails

      l_0_8[l_0_9] = l_0_10
      l_0_9 = "windbg"
      l_0_11 = "windbg_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "hrfwdrv"
      l_0_11 = "hrfwdrv_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "sysdiag"
      l_0_11 = "sysdiag_asr_driver"
      l_0_12 = 0
      l_0_13 = 2.8147497671066e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "radhwmgr"
      l_0_11 = "radhwmgr_asr_driver"
      l_0_12 = 0
      l_0_13 = 5.6310457224397e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "pplkiller"
      l_0_11 = "pplkiller_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "sysinfodetectorx64"
      l_0_11 = "sysinfodetector_asr_driver"
      l_0_12 = 0
      l_0_13 = 5.6294995342132e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "wnbios"
      l_0_11 = "wnbios_asr_driver"
      l_0_12 = 0
      l_0_13 = 2.8148356664525e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "probmon"
      l_0_11 = "probmon_asr_driver"
      l_0_12 = 0
      l_0_13 = 8.4442493013197e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "ksapi"
      l_0_11 = "ksapi_asr_driver"
      l_0_12 = 0
      l_0_13 = 5.6914242867914e+17
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "ldiagio"
      l_0_11 = "ldiagio_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.1259858061885e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "tdklib"
      l_0_11 = "tdklib_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.1259213817446e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "tdklib64"
      l_0_11 = "tdklib64_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.1259213817446e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "atidsmxx"
      l_0_11 = "atidsm_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "biontdrv"
      l_0_11 = "biontdrv_asr_driver"
      l_0_12 = 0
      l_0_13 = 5.6294995342131e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "rtsper"
      l_0_11 = "rtsper_asr_driver"
      l_0_12 = 0
      l_0_13 = 2.8147514776175e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "rtsuer"
      l_0_11 = "rtsuer_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "seasunprotect"
      l_0_11 = "seasunprotect_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "tboflhelper"
      l_0_11 = "tboflhelper_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "neofltr"
      l_0_11 = "jnprva_asr_driver"
      l_0_12 = 0
      l_0_13 = 6.1924795530609e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "wsftprm"
      l_0_11 = "wsftprm_asr_driver"
      l_0_12 = 0
      l_0_13 = 5.6294995342131e+14
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "procobsrvesx"
      l_0_11 = "procobsrvesx_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.1258999068427e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "szkg64"
      l_0_11 = "szkg64_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.1258999068427e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "tsdrvx64"
      l_0_11 = "tsdrvx64_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "psmounterex"
      l_0_11 = "psmounterex_asr_driver"
      l_0_12 = 0
      l_0_13 = 1.9703339329782e+15
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "accellid"
      l_0_11 = "accellid_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "adrmdrvsys"
      l_0_11 = "adlinkrsmgr_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "ltmdmnt"
      l_0_11 = "ltmdmnt_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = "viverraudio"
      l_0_11 = "viverraudio_asr_driver"
      l_0_12 = 0
      l_0_13 = 0
      l_0_8[l_0_9], l_0_10 = l_0_10, {l_0_11, l_0_12, l_0_13}
      l_0_9 = l_0_8[l_0_2]
      l_0_10 = nil
      if l_0_9 ~= l_0_10 then
        l_0_10 = "exclusion"
        l_0_10 = l_0_9[l_0_10]
        l_0_11 = nil
        if l_0_10 ~= l_0_11 then
          l_0_10 = versioning
          l_0_11 = "GetOrgID"
          l_0_10 = l_0_10[l_0_11]
          l_0_10 = (l_0_10())
          l_0_11 = nil
          if l_0_10 ~= l_0_11 then
            l_0_11, l_0_12 = l_0_10:lower, l_0_10
            l_0_11 = l_0_11(l_0_12)
            l_0_12 = "d7c7c745-195f-4223-9c7a-99fb420fd000"
            if l_0_11 == l_0_12 then
              l_0_11 = mp
              l_0_12 = "get_contextdata"
              l_0_11 = l_0_11[l_0_12]
              l_0_12 = mp
              l_0_13 = "CONTEXT_DATA_PROCESSNAME"
              l_0_12 = l_0_12[l_0_13]
              l_0_11 = l_0_11(l_0_12)
              l_0_12 = mp
              l_0_13 = "get_contextdata"
              l_0_12 = l_0_12[l_0_13]
              l_0_13 = mp
              l_0_14 = "CONTEXT_DATA_PROCESS_PPID"
              l_0_13 = l_0_13[l_0_14]
              l_0_12 = (l_0_12(l_0_13))
              l_0_13 = nil
              if l_0_12 ~= l_0_13 then
                l_0_13 = 1
                l_0_14 = "exclusion"
                l_0_14 = l_0_9[l_0_14]
                l_0_14 = #l_0_14
                for i = l_0_13, l_0_14 do
                  if l_0_11 ~= nil and (string.find)(l_0_11:lower(), (l_0_9.exclusion)[i]) and (MpCommon.IsFriendlyProcess)(l_0_12) == true then
                    return mp.CLEAN
                  end
                end
              end
            end
          end
        end
        do
          l_0_10 = "multi_version"
          l_0_10 = l_0_9[l_0_10]
          l_0_11 = nil
          if l_0_10 == l_0_11 then
            l_0_10 = 2
            l_0_10 = l_0_9[l_0_10]
            l_0_11 = 3
            l_0_11 = l_0_9[l_0_11]
            if l_0_10 > l_0_7 or l_0_7 > l_0_11 then
              l_0_12 = 0
              if l_0_10 == l_0_12 then
                l_0_12 = 0
                if l_0_11 == l_0_12 then
                  l_0_12 = mp
                  l_0_12 = l_0_12.get_contextdata
                  l_0_12 = l_0_12(mp.CONTEXT_DATA_SCANREASON)
                  if l_0_12 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
                    l_0_12 = mp
                    l_0_12 = l_0_12.set_mpattribute
                    l_0_12("BM_ESRP:Lua:" .. l_0_9[1])
                    l_0_12 = mp
                    l_0_12 = l_0_12.set_mpattribute
                    l_0_12("BM_ESRP:Lua:VulnerableAsrDriverMatched")
                  else
                    l_0_12 = mp
                    l_0_12 = l_0_12.set_mpattribute
                    l_0_12("BM_ESRP:Lua:VulnerableAsrNotOnClose")
                    l_0_12 = mp
                    l_0_12 = l_0_12.set_mpattribute
                    l_0_12("VulnDrv:Lua:" .. l_0_9[1])
                  end
                end
              end
              l_0_10 = "multi_version"
              l_0_10 = l_0_9[l_0_10]
              l_0_11 = 1
              l_0_12 = #l_0_10
              for i = l_0_11, l_0_12, 2 do
                local l_0_17, l_0_18 = nil
                l_0_17 = l_0_10[i]
                local l_0_19 = nil
                l_0_18 = 1
                l_0_18 = i + l_0_18
                l_0_18 = l_0_10[l_0_18]
                local l_0_20 = nil
                if l_0_17 <= l_0_7 and l_0_7 <= l_0_18 then
                  l_0_19 = mp
                  l_0_20 = "get_contextdata"
                  l_0_19 = l_0_19[l_0_20]
                  l_0_20 = mp
                  l_0_20 = l_0_20.CONTEXT_DATA_SCANREASON
                  l_0_19 = l_0_19(l_0_20)
                  l_0_20 = mp
                  l_0_20 = l_0_20.SCANREASON_ONMODIFIEDHANDLECLOSE
                  if l_0_19 == l_0_20 then
                    l_0_19 = mp
                    l_0_19 = l_0_19.set_mpattribute
                    l_0_20 = "BM_ESRP:Lua:"
                    l_0_20 = l_0_20 .. l_0_9[1]
                    l_0_19(l_0_20)
                    l_0_19 = mp
                    l_0_19 = l_0_19.set_mpattribute
                    l_0_20 = "BM_ESRP:Lua:VulnerableAsrDriverMatched"
                    l_0_19(l_0_20)
                  else
                    l_0_19 = mp
                    l_0_19 = l_0_19.set_mpattribute
                    l_0_20 = "BM_ESRP:Lua:VulnerableAsrNotOnClose"
                    l_0_19(l_0_20)
                    l_0_19 = mp
                    l_0_19 = l_0_19.set_mpattribute
                    l_0_20 = "VulnDrv:Lua:"
                    l_0_20 = l_0_20 .. l_0_9[1]
                    l_0_19(l_0_20)
                  end
                end
              end
              -- DECOMPILER ERROR at PC1280: Confused about usage of register R13 for local variables in 'ReleaseLocals'

              l_0_2 = nil
              if l_0_0 == l_0_2 then
                l_0_2 = mp
                l_0_2 = l_0_2.set_mpattribute
                l_0_3 = "BM_ESRP:Lua:UnversionedSignedDriver"
                l_0_2(l_0_3)
              end
              l_0_2 = versioning
              l_0_3 = "GetOrgID"
              l_0_2 = l_0_2[l_0_3]
              l_0_2 = (l_0_2())
              local l_0_21 = nil
              l_0_3 = nil
              if l_0_2 ~= l_0_3 then
                l_0_3 = string
                l_0_3 = l_0_3.lower
                l_0_4 = l_0_2
                l_0_3 = l_0_3(l_0_4)
                l_0_2 = l_0_3
              end
              l_0_3 = versioning
              l_0_4 = "GetTestMode"
              l_0_3 = l_0_3[l_0_4]
              l_0_3 = l_0_3()
              l_0_4 = 52159
              if l_0_3 ~= l_0_4 then
                l_0_3 = "d7c7c745-195f-4223-9c7a-99fb420fd000"
                if l_0_2 ~= l_0_3 then
                  l_0_3 = MpCommon
                  l_0_4 = "IsSampled"
                  l_0_3 = l_0_3[l_0_4]
                  l_0_4 = 15000
                  l_0_5 = false
                  l_0_6 = true
                  l_0_7 = true
                  l_0_3 = l_0_3(l_0_4, l_0_5, l_0_6, l_0_7)
                  l_0_4 = true
                  if l_0_3 ~= l_0_4 then
                    l_0_3 = mp
                    l_0_3 = l_0_3.CLEAN
                    return l_0_3
                  end
                end
              end
              l_0_3 = versioning
              l_0_4 = "GetEngineBuild"
              l_0_3 = l_0_3[l_0_4]
              l_0_3 = l_0_3()
              l_0_4 = 25050
              if l_0_3 < l_0_4 then
                l_0_3 = mp
                l_0_3 = l_0_3.CLEAN
                return l_0_3
              end
              l_0_3 = mp
              l_0_4 = "get_contextdata"
              l_0_3 = l_0_3[l_0_4]
              l_0_4 = mp
              l_0_5 = "CONTEXT_DATA_SCANREASON"
              l_0_4 = l_0_4[l_0_5]
              l_0_3 = l_0_3(l_0_4)
              local l_0_22 = nil
              l_0_4 = mp
              l_0_5 = "SCANREASON_ONOPEN"
              l_0_4 = l_0_4[l_0_5]
              if l_0_3 ~= l_0_4 then
                l_0_4 = mp
                l_0_5 = "SCANREASON_ONMODIFIEDHANDLECLOSE"
                l_0_4 = l_0_4[l_0_5]
                if l_0_3 ~= l_0_4 then
                  l_0_4 = mp
                  l_0_4 = l_0_4.CLEAN
                  return l_0_4
                end
              end
              l_0_4 = mp
              l_0_5 = "get_mpattribute"
              l_0_4 = l_0_4[l_0_5]
              l_0_5 = "BM_ESRP:Lua:VulnerableAsrNotOnClose"
              l_0_4 = l_0_4(l_0_5)
              if not l_0_4 then
                l_0_4 = mp
                l_0_5 = "get_mpattribute"
                l_0_4 = l_0_4[l_0_5]
                l_0_5 = "BM_ESRP:Lua:VulnerableAsrDriverMatched"
                l_0_4 = l_0_4(l_0_5)
                if not l_0_4 then
                  l_0_4 = mp
                  l_0_5 = "enum_mpattributesubstring"
                  l_0_4 = l_0_4[l_0_5]
                  l_0_5 = "ESRP:PEStatic:"
                  l_0_4 = (l_0_4(l_0_5))
                  local l_0_23 = nil
                  l_0_5 = nil
                  if l_0_4 == l_0_5 then
                    l_0_5 = mp
                    l_0_5 = l_0_5.CLEAN
                    return l_0_5
                  end
                  l_0_5 = type
                  l_0_6 = l_0_4
                  l_0_5 = l_0_5(l_0_6)
                  l_0_6 = "table"
                  if l_0_5 ~= l_0_6 then
                    l_0_5 = mp
                    l_0_5 = l_0_5.CLEAN
                    return l_0_5
                  end
                  l_0_5 = #l_0_4
                  l_0_6 = 0
                  if l_0_5 == l_0_6 then
                    l_0_5 = mp
                    l_0_5 = l_0_5.CLEAN
                    return l_0_5
                  end
                  l_0_5 = false
                  local l_0_24 = nil
                  l_0_6 = ipairs
                  l_0_7 = l_0_4
                  l_0_6 = l_0_6(l_0_7)
                  for l_0_9,l_0_10 in l_0_6 do
                    local l_0_25, l_0_26, l_0_27, l_0_28, l_0_29 = nil
                    if l_0_5 == false and ((string.find)((string.lower)(l_0_10), "^esrp:pestatic:.+%.sys$")) ~= nil then
                      l_0_5 = true
                      ;
                      (mp.set_mpattribute)("BM_ESRP:Lua:VulnerableAsrFromPEStatic")
                    end
                  end
                  if l_0_5 == false then
                    return mp.CLEAN
                  end
                end
              end
              do
                l_0_4 = "AsrTrackedVulDrivers"
                local l_0_30 = nil
                l_0_5 = "AsrRuleRqSpace"
                local l_0_31 = nil
                local l_0_32 = nil
                local l_0_33 = nil
                local l_0_34 = nil
                local l_0_35 = nil
                if not (mp.IsHipsRuleEnabled)("56a863a9-875e-4185-98a7-b882c64b5ce5") then
                  pcall(MpCommon.RollingQueueEraseNamespaced, l_0_4, l_0_5)
                  return mp.CLEAN
                end
                local l_0_36 = nil
                local l_0_37 = nil
                if (mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH) == nil or (mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH) == "" or ((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)) == nil or ((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)) == "" then
                  return mp.CLEAN
                end
                local l_0_38 = nil
                if ((MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH) .. l_0_21 .. l_0_22)) == nil or ((MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH) .. l_0_21 .. l_0_22)) == "" then
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC1498: Overwrote pending register: R13 in 'AssignReg'

                -- DECOMPILER ERROR at PC1502: Overwrote pending register: R13 in 'AssignReg'

                -- DECOMPILER ERROR at PC1503: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1504: Overwrote pending register: R13 in 'AssignReg'

                -- DECOMPILER ERROR at PC1505: Overwrote pending register: R14 in 'AssignReg'

                local l_0_39, l_0_40 = nil
                -- DECOMPILER ERROR at PC1511: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1514: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1515: Overwrote pending register: R15 in 'AssignReg'

                -- DECOMPILER ERROR at PC1516: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1519: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1520: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1521: Overwrote pending register: R15 in 'AssignReg'

                if pcall(l_0_21, l_0_22, l_0_30, l_0_31) and l_0_21 ~= l_0_22 then
                  if l_0_3 == l_0_22 then
                    l_0_22(l_0_30)
                  end
                  -- DECOMPILER ERROR at PC1523: Overwrote pending register: R14 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1524: Overwrote pending register: R14 in 'AssignReg'

                  return l_0_22
                end
                -- DECOMPILER ERROR at PC1526: Overwrote pending register: R14 in 'AssignReg'

                local l_0_41 = nil
                -- DECOMPILER ERROR at PC1527: Overwrote pending register: R15 in 'AssignReg'

                local l_0_42 = nil
                -- DECOMPILER ERROR at PC1528: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC1530: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC1531: Overwrote pending register: R17 in 'AssignReg'

                -- DECOMPILER ERROR at PC1535: Overwrote pending register: R14 in 'AssignReg'

                -- DECOMPILER ERROR at PC1537: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC1538: Overwrote pending register: R17 in 'AssignReg'

                -- DECOMPILER ERROR at PC1539: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC1540: Overwrote pending register: R17 in 'AssignReg'

                if l_0_31 then
                  local l_0_43 = nil
                  -- DECOMPILER ERROR at PC1542: Overwrote pending register: R17 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1545: Overwrote pending register: R17 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1546: Overwrote pending register: R17 in 'AssignReg'

                  if l_0_31 == l_0_32 then
                    l_0_32(l_0_33)
                    -- DECOMPILER ERROR at PC1549: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1550: Overwrote pending register: R17 in 'AssignReg'

                    return l_0_32
                  else
                    -- DECOMPILER ERROR at PC1553: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1554: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1555: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1556: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1558: Overwrote pending register: R18 in 'AssignReg'

                    local l_0_44 = nil
                    -- DECOMPILER ERROR at PC1560: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1563: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1564: Overwrote pending register: R18 in 'AssignReg'

                    if l_0_32 == l_0_33 then
                      return l_0_33
                    end
                    -- DECOMPILER ERROR at PC1566: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1567: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1569: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1572: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1573: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1575: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1580: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1581: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1582: Overwrote pending register: R19 in 'AssignReg'

                    if l_0_33 == l_0_34 and l_0_33 == l_0_34 and l_0_32 < l_0_31 then
                      l_0_33(l_0_34)
                      -- DECOMPILER ERROR at PC1584: Overwrote pending register: R15 in 'AssignReg'

                    end
                  end
                  do
                    -- DECOMPILER ERROR at PC1589: Overwrote pending register: R16 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1590: Overwrote pending register: R16 in 'AssignReg'

                    if not l_0_22 and not l_0_30 then
                      return l_0_31
                    end
                    -- DECOMPILER ERROR at PC1592: Overwrote pending register: R16 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1593: Overwrote pending register: R16 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1594: Overwrote pending register: R17 in 'AssignReg'

                    l_0_31(l_0_32)
                    -- DECOMPILER ERROR at PC1596: Overwrote pending register: R16 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1597: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1598: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1599: Overwrote pending register: R17 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1600: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1601: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1602: Confused about usage of register: R11 in 'UnsetPending'

                    do
                      local l_0_45 = nil
                      -- DECOMPILER ERROR at PC1608: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1609: Overwrote pending register: R18 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1610: Overwrote pending register: R19 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1611: Overwrote pending register: R18 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1612: Overwrote pending register: R19 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1613: Overwrote pending register: R20 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1614: Overwrote pending register: R21 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1615: Confused about usage of register: R6 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1615: Overwrote pending register: R22 in 'AssignReg'

                      if not l_0_31 then
                        l_0_38 = 1
                        l_0_32(l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38)
                        -- DECOMPILER ERROR at PC1618: Overwrote pending register: R17 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1619: Overwrote pending register: R18 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1620: Overwrote pending register: R19 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1621: Overwrote pending register: R18 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1622: Overwrote pending register: R19 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1623: Overwrote pending register: R20 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1624: Confused about usage of register: R11 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1624: Overwrote pending register: R21 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1625: Confused about usage of register: R5 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1625: Overwrote pending register: R22 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1626: Confused about usage of register: R6 in 'UnsetPending'

                        l_0_38 = 315360000
                        l_0_32(l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38)
                      end
                      -- DECOMPILER ERROR at PC1628: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1629: Overwrote pending register: R18 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1630: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1633: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1634: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1635: Overwrote pending register: R18 in 'AssignReg'

                      if l_0_3 == l_0_32 then
                        l_0_32(l_0_33)
                      end
                      -- DECOMPILER ERROR at PC1637: Overwrote pending register: R17 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1638: Overwrote pending register: R17 in 'AssignReg'

                      do return l_0_32 end
                      -- DECOMPILER ERROR at PC1640: Confused about usage of register R12 for local variables in 'ReleaseLocals'

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

