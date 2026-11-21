-- Threat: !InfrastructureShared
-- Name: !#Drivers
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if not peattributes.isdriver then
  return mp.CLEAN
end
if peattributes.no_security == true then
  mp.set_mpattribute("BM_ESRP:Lua:UnsignedDriver")
  return mp.CLEAN
end
local r0_0 = pe.get_versioninfo()
if r0_0 ~= nil and r0_0.OriginalFilename ~= nil then
  local r0_1 = r0_0.OriginalFilename
  r0_1 = r0_1:lower()
  r0_1 = r0_1:match("(.+)%.")
  if r0_1 == nil then
    r0_1 = r0_0.OriginalFilename:lower()
  end
  local r0_2 = false
  local r0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if r0_3 ~= nil then
    r0_3 = string.sub(r0_3, 0, -5)
    if r0_3 ~= nil and string.find(r0_3, r0_1, 1, true) == nil then
      mp.set_mpattribute("BM_ESRP:Lua:RenamedSignedDriver")
      r0_2 = true
    end
  end
  if r0_2 == false then
    mp.set_mpattribute("BM_ESRP:Lua:VersionedSignedDriver")
  end
  local r0_4 = {
    aiwsys = "Aiwsys", bandai = "Bandai", capcom = "Capcom", cpuz = "Cpuz", elbycdio = "Elbycdio",
    goad = "Goad", initdrv = "Initdrv", jtaxdfgznc = "Jtaxdfgznc", kmclass_x64 = "Kmclass_x64",
    libnicm = "Libnicm", nicm = "Nicm", nscm = "Nscm", rwdrv = "Rwdrv", termdd = "Termdd",
    tlsdrivegtw = "Tlsdrivegtw", vboxdrv = "Vboxdrv", xueman3 = "Xueman3", HwOs2Ec = "HwOs2Ec",
    phymem = "Phymem", asrdrv = "AsrDrv", atillk64 = "AtiLlk", bs_hwmio64_w10 = "BS_HWMIO64_W10",
    bs_i2cio = "BS_I2c64", bsmi = "BSMIx64", ucorew64 = "Ucorew64", ucoresys = "Ucoresys",
    amifldrv64 = "amifldrv64", glckio2 = "GLCKIO2", gvcidrv = "GVCIDrv", gdrv = "GDrv",
    gvcidrv64 = "GVCIDrv64", segwindrv = "segwindrv", segwindrvx64 = "segwindrvx64",
    msio64 = "MSIO64", ntiolib_x64 = "NTIOLib_X64", ntiolib = "NTIOLib", nbiolib_x64 = "NBIOLib_X64",
    nbiolib = "NBIOLib", winring0x64 = "WinRing0x64", winring0 = "WinRing0", modapi = "MODAPI",
    nvflash = "NvFlash", rtkio64 = "rtkio64", rtkio86 = "rtkio86", rtkiow8x86 = "rtkiow8x86",
    rtkiow8x64 = "rtkiow8x64", rtkiow10x86 = "rtkiow10x86", rtkiow10x64 = "rtkiow10x64",
    speedfan = "speedfan", sfdrvx32 = "speedfan", sfdrvx64 = "speedfan", kevp64 = "powertool",
    amdryzenmasterdriver = "amdryzenmaster"
  }
  if r0_4[r0_1] ~= nil then
    mp.set_mpattribute("BM_ESRP:Lua:" .. r0_4[r0_1])
  end
  local r0_5 = pe.get_fixedversioninfo()
  local r0_6 = r0_5.FileVersion
  if r0_6 ~= nil then
    local r0_7 = {}
    r0_7.cpuz = { "cpuz_asr_driver", 0, 281474976972803 }
    r0_7.elbycdio = { "elby_asr_driver", 0, 1688849860460546 }
    r0_7.libnicm = { "libnicm_asr_driver", 0, 844429225820160 }
    r0_7.mtcbsv64 = { "mtcbsv64_asr_driver", 0, 5910983100858368 }
    r0_7.nicm = { "nicm_asr_driver", 0, 844429225820160 }
    r0_7.nscm = { "nscm_asr_driver", 0, 844429225820160 }
    r0_7.sandra = { "sandra_asr_driver", 0, 2814801306714112 }
    r0_7.rtkio64 = { "rtkio64_asr_driver", 0, 0 }
    r0_7.rtkiow10x64 = { "rtkiow10x64_asr_driver", 0, 0 }
    r0_7.rtkiow8x64 = { "rtkiow8x64_asr_driver", 0, 0 }
    r0_7.bsmi = { "bsmi_asr_driver", 0, 281474976710659 }
    r0_7.bs_hwmio64_w10 = { "bs_hwmio64_asr_driver", 0, 2814749885515776 }
    r0_7.bs_i2cio = { "biostar_io_asr_driver", 0, 281479271677952 }
    r0_7.ntiolib = { "ntiolib_asr_driver", 0, 281474976710656 }
    r0_7.nchgbios2x64 = { "nchgbios2x64_asr_driver", 0, 1125908497039360 }
    r0_7.gdrv = { "gdrv_asr_driver", 0, 0 }
    r0_7["kernel-bridge"] = { "kernelbridge_asr_driver", 0, 0 }
    r0_7.rwdrv = { "rwdrv_asr_driver", 0, 0 }
    r0_7.speedfan = { "speedfan_asr_driver", 0, 0 }
    r0_7.sfdrvx32 = { "speedfan_asr_driver", 0, 0 }
    r0_7.sfdrvx64 = { "speedfan_asr_driver", 0, 0 }
    r0_7.kevp64 = { "powertoolx64_asr_driver", 0, 0 }
    r0_7.amdryzenmasterdriver = { "amdryzenmaster_asr_driver", 0, 281496451547136 }
    r0_7.viragt = { "viragt_asr_driver", 0, 281818574094336 }
    r0_7.viragt64 = { "viragt64_asr_driver", 0, 281474976710679 }
    r0_7.kprocesshacker = { "processhacker_asr_driver", 0, 0 }
    r0_7.physmem = { "physicalmem_asr_driver", 0, 0 }
    r0_7.phymem = { "phymem_asr_driver", 0, 0 }
    r0_7.amp = { "sm_amp_asr_driver", 0, 0 }
    r0_7.iqvw64 = { "iqvw64_asr_driver", 0, 281492156579861 }
    r0_7.winring0 = { "winring0_asr_driver", 0, 0 }
    r0_7.hpportiox64 = { "hpportiox64_asr_driver", 0, 0 }
    r0_7.lha = { "lha_asr_driver", 0, 0 }
    r0_7.gmer64 = { "gmer_asr_driver", 0, 0 }
    r0_7.pchunter = { "pchunter_asr_driver", 0, 0 }
    r0_7.tvichw64 = { "tvicp_asr_driver", 0, 0 }
    r0_7.tvicport = { "tvicf_asr_driver", 0, 0 }
    r0_7.ssport = { "ssport_asr_driver", 281474976710656, 281474976710656 }
    r0_7.vmdrv = { "vmdrv_asr_driver", 0, 0 }
    r0_7.aswarpot = { "aswarpot_asr_driver", 0, 5910995985760255 }
    r0_7.bs_rcio64 = { "bs_rcio64_asr_driver", 0, 0 }
    r0_7.lgcoretemp = { "lgcoretemp_asr_driver", 0, 281474976710657 }
    r0_7.sandbox = { "agsandbox_asr_driver", 0, 0 }
    r0_7.amdpowerprofiler = { "amdpowerprofiler_asr_driver", 1688849860263936, 1688854155231232 }
    r0_7.aswsnx = { "aswsnx_asr_driver", 0, 4785083194015744 }
    r0_7.asrdrv = { "asrdrv_asr_driver", 0, 0 }
    r0_7.hwos2ec = { "hwos2ec_asr_driver", 0, 281474976710657 }
    r0_7.bs_def64 = { "bsdef64_asr_driver", 0, 0 }
    r0_7.lenovodiagnosticsdriver = { "lenovodiag_asr_driver", 0, 562949953421311 }
    r0_7.superbmc = { "superbmc_asr_driver", 0, 562949953421312 }
    r0_7.procexp = { "procexp_asr_driver", 0, 1114121 }
    r0_7.iobitunlocker = { "iobitunlocker_asr_driver", 0, 0 }
    r0_7.agent64 = { "agent64_asr_driver", 0, 0 }
    r0_7.nvflash = { "nvflash_asr_driver", 0, 281513631416320 }
    r0_7.inpoutx64 = { "inpoutx64_asr_driver", 0, 0 }
    r0_7.alsysio = { "alsysio_asr_driver", 0, 562949954011136 }
    r0_7.atillk64 = { "atillk64_asr_driver", 0, 0 }
    r0_7.hw = { "hw_asr_driver", 0, 0 }
    r0_7.wiseunlo = { "wiseunlo_asr_driver", 0, 0 }
    r0_7.klmd = { "klmd_asr_driver", 0, 563005787996170 }
    r0_7.tmel = { "tmel_asr_driver", 0, 281500746515436 }
    r0_7.lv561v64 = { "lv561v64_asr_driver", 0, 0 }
    r0_7.symelam = { "symelam_asr_driver", 0, 562967133290579 }
    r0_7.hwrwdrv = { "hwrwdrv_asr_driver", 0, 0 }
    r0_7.monitor = { "monitor_asr_driver", 0, 281483566645259 }
    r0_7.otipcibus64 = { "otipcibus64_asr_driver", 0, 0 }
    r0_7.asrsetupdrv103 = { "asrsetupdrv_asr_driver", 0, 0 }
    r0_7.hardwarering0 = { "hwring0_asr_driver", 0, 0 }
    r0_7.mydrivers = { "dghwmonitor_asr_driver", 0, 0 }
    r0_7.driver7 = { "ectool_asr_driver", 0, 0 }
    r0_7.iuforcedelete = { "iuforcedelete_asr_driver", 0, 0 }
    r0_7.aswelam = { "avgelam_asr_driver", 0, 6192475283718143 }
    r0_7.avgelam = { "avgelam_asr_driver", 0, 6192475283718143 }
    r0_7.eelam = { "eelam_asr_driver", 0, 2814749768155136 }
    r0_7.rzpnk = { "rzpnk_asr_driver", 0, 0 }
    r0_7.hwinfo64a = { "hwinfo_asr_driver", 0, 2253251512631296 }
    r0_7.hwinfo64i = { "hwinfo_asr_driver", 0, 2253251512631296 }
    r0_7.eio = { "eio_asr_driver", 0, 0 }
    r0_7.bsmem64_w10 = { "bsmiw10_asr_driver", 0, 0 }
    r0_7.aswsp = { "aswsp_asr_driver", 0, 5629533893951488 }
    r0_7.ctiio64 = { "ctiio64_asr_driver", 0, 281479273185685 }
    r0_7.msio64 = { "msio64_asr_driver", 0, 281487863120277 }
    r0_7.msio32 = { "msio32_asr_driver", 0, 281487863120277 }
    r0_7.pcdsrvc = { "pcdsrvc_asr_driver", 0, 1688862745165823 }
    r0_7["corsair ll access"] = { "corsairllaccess_asr_driver", 0, 281474978283519 }
    r0_7.openlibsys = { "openlibsys_asr_driver", 0, 0 }
    r0_7.sysdrv3s = { "sysdrv3s_asr_driver", 0, 844450699935744 }
    r0_7.iomem = { "iomem_asr_driver", 562958543355904, 562962838323200 }
    r0_7.etdsupp = { "etdsupport_asr_driver", 0, 0 }
    r0_7.athr = { "qcamain10x64_asr_driver", 3377699720527872, 3377699720528698 }
    r0_7.truesight = { "truesight_asr_driver", 0, 844437815033856 }
    r0_7.nvoclock = { "nvoclock_asr_driver", 0, 0 }
    r0_7.ashitio_drv = { "ashitio_asr_driver", 0, 7599824371187714 }
    r0_7.iomap = { "iomap_asr_driver", 0, 844424930131967 }
    r0_7.atlaccess = { "atlaccess_asr_driver", 0, 0 }
    r0_7.computerz = { "computerz_asr_driver", 0, 0 }
    r0_7.vdbsv64 = { "vdbsv64_asr_driver", 0, 0 }
    r0_7.cp2x72c = { "cp2x72c_asr_driver", 0, 0 }
    r0_7.wirwadrv = { "wirwadrv_asr_driver", 0, 0 }
    r0_7.cg6kwin2k = { "cg6kwin2k_asr_driver", 0, 0 }
    r0_7.gdrv3 = { "gdrv3_asr_driver", 0, 281479271677959 }
    r0_7.sbiosio64 = { "sbiosio64_asr_driver", 0, 0 }
    r0_7.ngiodriver = { "ngiodriver_asr_driver", 0, 0 }
    r0_7.stdcdrv64 = { "stdcdrv64_asr_driver", 0, 0 }
    r0_7.stdcdrvws64 = { "stdcdrvws64_asr_driver", 0, 0 }
    r0_7.rtif = { "rtif_asr_driver", 0, 0 }
    r0_7.fpcie2com = { "fpcie2com_asr_driver", 0, 0 }
    r0_7.rtport = { "rtport_asr_driver", 0, 0 }
    r0_7.pdfwkrnl = { "pdfwkrnl_asr_driver", 0, 0 }
    r0_7.avalueio = { "avalueio_asr_driver", 0, 0 }
    r0_7.hwdetectng = { "hwdetectng_asr_driver", 0, 0 }
    r0_7.appid = {
      "appid_asr_driver", 0, 0, exclusion = { "dismhost.exe", "tiworker.exe", "cbss.exe" },
      multi_version = {
        2814751250251776, 2814751250254930, 2814751431589888, 2814751431590596, 2814751249596416,
        2814751249599570, 2814751208898560, 2814751208901336, 2814751100633088, 2814751100635409,
        2814751015174144, 2814751015178189, 2814751015239680, 2814751015243725, 2814750931222528,
        2814750931227985
      }
    }
    r0_7.windbg = { "windbg_asr_driver", 0, 0 }
    r0_7.hrfwdrv = { "hrfwdrv_asr_driver", 0, 0 }
    r0_7.sysdiag = { "sysdiag_asr_driver", 0, 281474976710656 }
    r0_7.radhwmgr = { "radhwmgr_asr_driver", 0, 563104572243967 }
    r0_7.pplkiller = { "pplkiller_asr_driver", 0, 0 }
    r0_7.sysinfodetectorx64 = { "sysinfodetector_asr_driver", 0, 562949953421317 }
    r0_7.wnbios = { "wnbios_asr_driver", 0, 281483566645248 }
    r0_7.probmon = { "probmon_asr_driver", 0, 844424930131972 }
    r0_7.ksapi = { "ksapi_asr_driver", 0, 569142428679143465 }
    r0_7.ldiagio = { "ldiagio_asr_driver", 0, 1125985806188544 }
    r0_7.tdklib = { "tdklib_asr_driver", 0, 1125921381744639 }
    r0_7.tdklib64 = { "tdklib64_asr_driver", 0, 1125921381744639 }
    r0_7.atidsmxx = { "atidsm_asr_driver", 0, 0 }
    r0_7.biontdrv = { "biontdrv_asr_driver", 0, 562949953421311 }
    r0_7.rtsper = { "rtsper_asr_driver", 0, 2814751477617532 }
    r0_7.rtsuer = { "rtsuer_asr_driver", 0, 2814751477627447 }
    r0_7.seasunprotect = { "seasunprotect_asr_driver", 0, 0 }
    r0_7.tboflhelper = { "tboflhelper_asr_driver", 0, 0 }
    r0_7.neofltr = { "jnprva_asr_driver", 0, 6192479553060873 }
    r0_7.wsftprm = { "wsftprm_asr_driver", 0, 562949953421312 }
    r0_7.procobsrvesx = { "procobsrvesx_asr_driver", 0, 1125899906842673 }
    r0_7.szkg64 = { "szkg64_asr_driver", 0, 1125899906842673 }
    r0_7.tsdrvx64 = { "tsdrvx64_asr_driver", 0, 4295032838 }
    r0_7.psmounterex = { "psmounterex_asr_driver", 0, 1970333932978176 }
    r0_7.accellid = { "accellid_asr_driver", 0, 0 }
    r0_7.adrmdrvsys = { "adlinkrsmgr_asr_driver", 281496472061922, 281526568880102 }
    r0_7.ltmdmnt = { "ltmdmnt_asr_driver", 0, 0 }
    r0_7.viverraudio = { "viverraudio_asr_driver", 0, 0 }
    r0_7.nseckrnl = { "nseckrnl_asr_driver", 0, 0 }
    r0_7.mbamchameleon = { "mbamchameleon_asr_driver", 0, 844433520066559 }
    r0_7.thelper = { "thelper_asr_driver", 0, 0 }
    r0_7.wrkrn = { "wrkrn_asr_driver", 0, 2533274793148457 }
    r0_7.h2offt64 = { "h2offt64_asr_driver", 844424930131969, 844424930131970 }
    r0_7.h2offt32 = { "h2offt32_asr_driver", 844424930131969, 844424930131970 }
    r0_7.h2offt = { "h2offt_asr_driver", 844424930131969, 844424930131970 }
    r0_7.segwindrv = { "segwindrv_asr_driver", 0, 56295003932131327 }
    r0_7.segwindrvx64 = { "segwindrvx64_asr_driver", 0, 56295003932131327 }
    r0_7.k7rkscan = { "k7rkscan_asr_driver", 0, 6473924464345098 }
    r0_7.cyvrlpc = { "cyvrlpc_asr_driver", 0, 2251808403800620 }
    r0_7.forcedelete = { "imfforcedelete_asr_driver", 0, 1970324836974602 }
    r0_7.bsitf = { "bsitf_asr_driver", 844433520787456, 844433520852992 }
    r0_7.iocdrv = { "iocdrv_asr_driver", 0, 1688871335231526 }
    r0_7.ktdifilt = { "ktdifilt_asr_driver", 566890607390883874, 570268319996575853 }
    r0_7.lenovodriverbus = { "lenovodriverbus_asr_driver", 0, 562949953421446 }
    r0_7.cormem = { "cormem_asr_driver", 2533274790395904, 2533326330005886 }
    r0_7.sivx64 = { "sivx64_asr_driver", multi_version = { 196611, 196644, 262144, 262185 } }
    r0_7.nvi2systemservice = { "nvi2systemservice_asr_driver", 0, 0 }
    r0_7.appshopdrv100 = { "appshopdrv100_asr_driver", 281474976710656, 281474976710656 }
    r0_7.appshopdrv101 = { "appshopdrv101_asr_driver", 281474976710656, 281474976710656 }
    r0_7.appshopdrv102 = { "appshopdrv102_asr_driver", 281474976710656, 281474976710656 }
    r0_7.appshopdrv103 = { "appshopdrv103_asr_driver", 281474976710656, 281474976710656 }
    r0_7.argusmonitor = { "argusmonitor_asr_driver", 0, 17179869183 }
    r0_7.cpmprov = { "cpmprov_asr_driver", 0, 562980018192383 }
    r0_7.bootrepair = { "bootrepair_asr_driver", 562971430235153, 562971430235153 }
    r0_7.ktapi = { "ktapi_asr_driver", 0, 4294969195 }
    r0_7.gamedriverx64 = { "gamedriverx64_asr_driver", 0, 1970423621484551 }
    r0_7.rtstpx = { "rtstpx_asr_driver", 0, 0 }
    r0_7.iomanager = { "iomanager_asr_driver", 0, 0 }
    r0_7.devmemdrv = { "devmemdrv_asr_driver", 0, 0 }
    r0_7.rspot = { "rspot_asr_driver", 0, 281474976710672 }
    r0_7.dpmemio = { "dpmemio_asr_driver", 281474976710658, 1688850253496322 }
    r0_7.memctl = { "memctl_asr_driver", 281492288372738, 281492288372738 }
    r0_7.asrcddrv = { "asrcddrv_asr_driver", 0, 281474976710656 }
    r0_7.processmonitordriver = { "processmonitordriver_asr_driver", 0, 3096370773032959 }
    r0_7.gibepext = { "gibepext_asr_driver", 0, 0 }
    r0_7["denuvo-anti-cheat-driver"] = {
      "denuvoanticheatdriver_asr_driver", 71776119062600502, 71776119062600502
    }
    r0_7.ggprotect64 = { "ggprotect64_asr_driver", 562958543749126, 844437815558154 }
    r0_7.svioctrlx64 = { "svioctrlx64_asr_driver", 281474976710656, 281474976710656 }
    r0_7.qiomem = { "qiomem_asr_driver", 0, 0 }
    r0_7.ksldriver = { "ksldriver_asr_driver", 0, 281480978959294 }
    r0_7.ksld = { "ksldriver_asr_driver", 0, 281480978959294 }
    r0_7.andappsvc2_64 = { "deresute64_asr_driver", 0, 281479271677952 }
    r0_7.selfprot = { "selfprot_asr_driver", 281474976710657, 281474976710657 }
    r0_7.srswdrv = { "srswdrv_asr_driver", 0, 1407379178651648 }
    r0_7.ccprotect = { "ccprotect_asr_driver", 0, 281487861809153 }
    r0_7.iruff = { "iruff_asr_driver", 281474976710664, 281474976710665 }
    r0_7.cmupx = { "cmupx_asr_driver", 0, 281530811285504 }
    r0_7.jywinring0 = { "jywinring0_asr_driver", 0, 0 }
    r0_7.pskmad_64 = { "pskmad_64_asr_driver", 0, 281479271677973 }
    r0_7.hax = { "hax_asr_driver", 0, 30065229824 }
    r0_7.ardrv = { "ardrv_asr_driver", 0, 567735070975198735 }
    r0_7.kmwpsms = { "kmwpsms_asr_driver", 0, 51540197382 }
    r0_7.wdtkernel = { "wdtkernel_asr_driver", 0, 281492156645376 }
    r0_7.atszio = { "atszio_asr_driver", 0, 0 }
    r0_7.pgpwded = { "pgpwded_asr_driver", 0, 47244640257 }
    r0_7.astra64 = { "astra64_asr_driver", 0, 0 }
    r0_7.ipctype = { "ipctype_asr_driver", 0, 0 }
    r0_7["adlice rootlaser"] = { "adlicerootlaser_asr_driver", 0, 12885229567 }
    r0_7.athpexnt = { "athpexnt_asr_driver", 0, 0 }
    r0_7.fsfilter = { "fsfilter_asr_driver", 0, 0 }
    r0_7.amdtools64 = { "amdtools64_asr_driver", 0, 281505042595839 }
    r0_7.lecomax = { "lecomax_asr_driver", 0, 0 }
    r0_7.ccekrnl = { "ccekrnl_asr_driver", 3377708310601548, 3377708310601548 }
    if versioning.IsSampled(4000, false, false, false) == true then
      r0_7.advcare = { "advcare_asr_driver", 0, 562949953421312 }
    end
    local r0_8 = r0_7[r0_1]
    if r0_8 ~= nil then
      local r0_9 = versioning.GetOrgID()
      mp.set_mpattribute("BM_ESRP:Lua:" .. r0_1 .. ":" .. tostring(r0_6))
      if r0_8.exclusion ~= nil
        and r0_9 ~= nil
        and r0_9:lower() == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
        local r0_10 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
        local r0_11 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
        if r0_11 ~= nil then
          for r0_12 = 1, #r0_8.exclusion do
            local r0_13 = r0_8.exclusion
            r0_13 = r0_13[r0_12]
            if r0_10 ~= nil
              and string.find(r0_10:lower(), r0_13)
              and MpCommon.IsFriendlyProcess(r0_11) == true then
              return mp.CLEAN
            end
          end
        end
      end
      if r0_8.multi_version == nil then
        local r0_14 = r0_8[2]
        local r0_15 = r0_8[3]
        if r0_14 <= r0_6 and r0_6 <= r0_15 or r0_14 == 0 and r0_15 == 0 then
          if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
            local r0_16 = mp.set_mpattribute
            local r0_17 = r0_8[1]
            local r0_18 = "BM_ESRP:Lua:" .. r0_17
            r0_17 = nil
            r0_16(r0_18)
            mp.set_mpattribute("BM_ESRP:Lua:VulnerableAsrDriverMatched")
          else
            mp.set_mpattribute("BM_ESRP:Lua:VulnerableAsrNotOnClose")
            local r0_19 = mp.set_mpattribute
            local r0_20 = r0_8[1]
            local r0_21 = "VulnDrv:Lua:" .. r0_20
            r0_20 = nil
            r0_19(r0_21)
          end
        end
      else
        local r0_22 = r0_8.multi_version
        for r0_23 = 1, #r0_22, 2 do
          local r0_24 = r0_22[r0_23]
          local r0_25 = r0_22[r0_23 + 1]
          if r0_24 <= r0_6 and r0_6 <= r0_25 then
            if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
              local r0_26 = mp.set_mpattribute
              local r0_27 = r0_8[1]
              local r0_28 = "BM_ESRP:Lua:" .. r0_27
              r0_27 = nil
              r0_26(r0_28)
              mp.set_mpattribute("BM_ESRP:Lua:VulnerableAsrDriverMatched")
            else
              mp.set_mpattribute("BM_ESRP:Lua:VulnerableAsrNotOnClose")
              local r0_29 = mp.set_mpattribute
              local r0_30 = r0_8[1]
              local r0_31 = "VulnDrv:Lua:" .. r0_30
              r0_30 = nil
              r0_29(r0_31)
            end
          end
        end
      end
    end
  end
elseif r0_0 == nil then
  mp.set_mpattribute("BM_ESRP:Lua:UnversionedSignedDriver")
end
if versioning.GetEngineBuild() < 25050 then
  return mp.CLEAN
end
local r0_32 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_32 ~= mp.SCANREASON_ONOPEN and r0_32 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("BM_ESRP:Lua:VulnerableAsrNotOnClose")
  and not mp.get_mpattribute("BM_ESRP:Lua:VulnerableAsrDriverMatched") then
  local r0_33 = mp.enum_mpattributesubstring("ESRP:PEStatic:")
  if r0_33 == nil then
    return mp.CLEAN
  end
  if type(r0_33) ~= "table" then
    return mp.CLEAN
  end
  if #r0_33 == 0 then
    return mp.CLEAN
  end
  do
    local r0_34 = false
    for r0_35, r0_36 in ipairs(r0_33) do
      if r0_34 == false and string.find(string.lower(r0_36), "^esrp:pestatic:.+%.sys$") ~= nil then
        r0_34 = true
        mp.set_mpattribute("BM_ESRP:Lua:VulnerableAsrFromPEStatic")
      end
    end
    local r0_37 = false
    if r0_34 == r0_37 then
      return mp.CLEAN
    end
  end
end
local r0_38, r0_39, r0_40, r0_41, r0_42, r0_43, r0_44 = "AsrTrackedVulDrivers", "AsrTrackedVulDriversRQ1", "AsrRuleRqSpace", 1, 315360000, 1000, 1
if not mp.IsHipsRuleEnabled("56a863a9-875e-4185-98a7-b882c64b5ce5") then
  pcall(MpCommon.RollingQueueEraseNamespaced, r0_39, r0_40)
  pcall(MpCommon.RollingQueueEraseNamespaced, r0_38, r0_40)
  return mp.CLEAN
end
local r0_45 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
local r0_46 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if r0_45 ~= nil and r0_45 ~= "" and r0_46 ~= nil and r0_46 ~= "" then
  local r0_47 = MpCommon.PathToWin32Path(r0_45 .. "\\" .. r0_46)
  if r0_47 ~= nil and r0_47 ~= "" then
    r0_47 = string.lower(r0_47)
    local r0_48, r0_49 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, r0_39, r0_40, r0_47)
    if r0_48 and r0_49 ~= nil then
      if r0_32 == mp.SCANREASON_ONOPEN then
        mp.set_mpattribute("ALF:BM_ESRP:Lua:VulnerableAsrForOnOpen")
      end
      local r0_50, r0_51 = pcall(MpCommon.RollingQueueCountNamespaced, r0_38, r0_40)
      if r0_50 and r0_51 ~= nil and type(r0_51) == "number" then
        pcall(MpCommon.RollingQueueEraseNamespaced, r0_38, r0_40)
      end
      return mp.CLEAN
    end
    local r0_52, r0_53 = false, false
    if mp.get_mpattribute("BM_ESRP:Lua:VulnerableAsrDriverMatched") then
      r0_52 = true
    else
      local r0_54 = MpCommon.GetAsrRuleStateAge("56a863a9-875e-4185-98a7-b882c64b5ce5")
      if r0_54 == nil then
        mp.set_mpattribute("ALF:BM_ESRP:Lua:VulAsrClockChanged")
        return mp.CLEAN
      end
      local r0_55 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
      if r0_55 == nil then
        return mp.CLEAN
      end
      if type(r0_55) == "number" and type(r0_54) == "number" and r0_55 < r0_54 then
        mp.set_mpattribute("ALF:BM_ESRP:Lua:VulDrvDroppedAfterRule")
        r0_53 = true
      end
    end
    if not r0_52 and not r0_53 then
      return mp.CLEAN
    end
    mp.set_mpattribute("ALF:BM_ESRP:Lua:VulAsrAddedToRQ")
    local r0_56 = pcall(MpCommon.RollingQueueAppendNamespaced, r0_39, r0_40, r0_47, r0_41, r0_42)
    if not r0_56 then
      pcall(MpCommon.RollingQueueCreateNamespaced, r0_39, r0_40, r0_43, r0_42, r0_44)
      pcall(MpCommon.RollingQueueAppendNamespaced, r0_39, r0_40, r0_47, r0_41, r0_42)
    end
    if r0_32 == mp.SCANREASON_ONOPEN then
      mp.set_mpattribute("ALF:BM_ESRP:Lua:VulnerableAsrForOnOpen")
    end
    local r0_57, r0_58 = pcall(MpCommon.RollingQueueCountNamespaced, r0_38, r0_40)
    if r0_57 and r0_58 ~= nil and type(r0_58) == "number" then
      pcall(MpCommon.RollingQueueEraseNamespaced, r0_38, r0_40)
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
