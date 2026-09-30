# f-4 GDB reproduction

Launch command used throughout (crashes deterministically at event 47):

```bash
> gdb -nx \
  -x /repro/combined-gdbinit \
  -ex run \
  --args \
  /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon \
  -Pdd4hep:xml_files="$DETECTOR_COMPACT" \
  -Ppodio:output_file="/repro/debug-out2.eicrecon.edm4eic.root" \
  -Pjana:warmup_timeout=0 \
  -Pjana:timeout=0 \
  "/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root"
GNU gdb (GDB) 17.1
Copyright (C) 2025 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon...
(No debugging symbols found in /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon)
Starting program: /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon -Pdd4hep:xml_files=/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml -Ppodio:output_file=/repro/debug-out2.eicrecon.edm4eic.root -Pjana:warmup_timeout=0 -Pjana:timeout=0 /repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root
⚠️ warning: Error disabling address space randomization: Operation not permitted
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[Detaching after vfork from child process 37886]
[Detaching after vfork from child process 37888]
[Detaching after vfork from child process 37890]

15:05:55.936  [warn] Setting signal handler USR1. Use to write status info to the named pipe.
15:05:55.936  [warn] Setting signal handler SIGINT (Ctrl-C). Use a single SIGINT to enter the Inspector, or multiple SIGINTs for an immediate shutdown.
15:05:55.936  [info] JWiringService: No wiring file used
15:05:55.936  [info] Initializing...
15:05:55.936  [info] 
15:05:55.936  [info]        |    \      \  |     \    ___ \   
15:05:55.936  [info]        |   _ \      \ |    _ \      ) |
15:05:55.936  [info]    \   |  ___ \   |\  |   ___ \    __/
15:05:55.936  [info]   \___/ _/    _\ _| \_| _/    _\ _____|
15:05:55.936  [info] 
15:05:55.936  [info]   JANA2 version:   2026.2.0  (unknown git status)
15:05:55.936  [info]   Install prefix:  /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n
15:05:55.936  [info]   Optional deps:   Podio ROOT 
15:05:55.936  [info] 
15:05:55.954  [info] Loading plugin 'log' from '/opt/local/lib/EICrecon/plugins/log.so'
15:05:56.320  [info] Loading plugin 'dd4hep' from '/opt/local/lib/EICrecon/plugins/dd4hep.so'
15:05:56.335  [info] Loading plugin 'evaluator' from '/opt/local/lib/EICrecon/plugins/evaluator.so'
15:05:57.988  [info] Loading plugin 'acts' from '/opt/local/lib/EICrecon/plugins/acts.so'
15:05:58.224  [info] Loading plugin 'algorithms_init' from '/opt/local/lib/EICrecon/plugins/algorithms_init.so'
15:05:58.258  [info] Loading plugin 'pid_lut' from '/opt/local/lib/EICrecon/plugins/pid_lut.so'
15:05:58.302  [info] Loading plugin 'richgeo' from '/opt/local/lib/EICrecon/plugins/richgeo.so'
15:05:58.318  [info] Loading plugin 'rootfile' from '/opt/local/lib/EICrecon/plugins/rootfile.so'
15:05:58.356  [info] Loading plugin 'beam' from '/opt/local/lib/EICrecon/plugins/beam.so'
15:05:58.767  [info] Loading plugin 'reco' from '/opt/local/lib/EICrecon/plugins/reco.so'
15:05:58.876  [info] Loading plugin 'tracking' from '/opt/local/lib/EICrecon/plugins/tracking.so'
15:05:58.942  [info] Loading plugin 'particle_flow' from '/opt/local/lib/EICrecon/plugins/particle_flow.so'
15:05:59.013  [info] Loading plugin 'pid' from '/opt/local/lib/EICrecon/plugins/pid.so'
15:05:59.081  [info] Loading plugin 'global_pid_lut' from '/opt/local/lib/EICrecon/plugins/global_pid_lut.so'
15:05:59.274  [info] Loading plugin 'EEMC' from '/opt/local/lib/EICrecon/plugins/EEMC.so'
15:05:59.428  [info] Loading plugin 'BEMC' from '/opt/local/lib/EICrecon/plugins/BEMC.so'
15:05:59.504  [info] Loading plugin 'FEMC' from '/opt/local/lib/EICrecon/plugins/FEMC.so'
[] [dd4hep] [info] Loading DD4hep geometry from 1 files
[] [dd4hep] [info]   - loading geometry file:  '/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml' (patience ....)
[] [dd4hep] [info] Geometry successfully loaded.
[] [FEMC] [info] Homogeneous geometry loaded
15:06:20.149  [info] Loading plugin 'EHCAL' from '/opt/local/lib/EICrecon/plugins/EHCAL.so'
15:06:20.218  [info] Loading plugin 'BHCAL' from '/opt/local/lib/EICrecon/plugins/BHCAL.so'
15:06:20.294  [info] Loading plugin 'FHCAL' from '/opt/local/lib/EICrecon/plugins/FHCAL.so'
15:06:20.356  [info] Loading plugin 'B0ECAL' from '/opt/local/lib/EICrecon/plugins/B0ECAL.so'
15:06:20.424  [info] Loading plugin 'ZDC' from '/opt/local/lib/EICrecon/plugins/ZDC.so'
15:06:20.472  [info] Loading plugin 'BTRK' from '/opt/local/lib/EICrecon/plugins/BTRK.so'
15:06:20.519  [info] Loading plugin 'BVTX' from '/opt/local/lib/EICrecon/plugins/BVTX.so'
15:06:20.567  [info] Loading plugin 'PFRICH' from '/opt/local/lib/EICrecon/plugins/PFRICH.so'
15:06:20.618  [info] Loading plugin 'DIRC' from '/opt/local/lib/EICrecon/plugins/DIRC.so'
15:06:20.692  [info] Loading plugin 'DRICH' from '/opt/local/lib/EICrecon/plugins/DRICH.so'
15:06:20.740  [info] Loading plugin 'ECTRK' from '/opt/local/lib/EICrecon/plugins/ECTRK.so'
15:06:20.793  [info] Loading plugin 'MPGD' from '/opt/local/lib/EICrecon/plugins/MPGD.so'
[] [tracking] [info] pixel XML loaded for "InnerMPGDBarrel"
[] [tracking] [info] pixel XML loaded for "MPGDOuterBarrel"
[] [tracking] [info] pixel digitization will be applied to "InnerMPGDBarrel"
[] [tracking] [info] pixel digitization will be applied to "MPGDOuterBarrel"
15:06:20.841  [info] Loading plugin 'B0TRK' from '/opt/local/lib/EICrecon/plugins/B0TRK.so'
15:06:21.026  [info] Loading plugin 'RPOTS' from '/opt/local/lib/EICrecon/plugins/RPOTS.so'
15:06:21.079  [info] Loading plugin 'FOFFMTRK' from '/opt/local/lib/EICrecon/plugins/FOFFMTRK.so'
15:06:21.155  [info] Loading plugin 'BTOF' from '/opt/local/lib/EICrecon/plugins/BTOF.so'
15:06:21.229  [info] Loading plugin 'ECTOF' from '/opt/local/lib/EICrecon/plugins/ECTOF.so'
15:06:21.322  [info] Loading plugin 'LOWQ2' from '/opt/local/lib/EICrecon/plugins/LOWQ2.so'
15:06:21.388  [info] Loading plugin 'LUMISPECCAL' from '/opt/local/lib/EICrecon/plugins/LUMISPECCAL.so'
15:06:21.536  [info] Loading plugin 'podio' from '/opt/local/lib/EICrecon/plugins/podio.so'
15:06:21.557  [info] Loading plugin 'janatop' from '/opt/local/lib/EICrecon/plugins/janatop.so'
15:06:22.830  [warn] Parameter 'EHCAL:HcalEndcapNClustersWithoutShapes:InputTags' has conflicting defaults: 'HcalEndcapNSplitMergeProtoClusters,HcalEndcapNRawHitLinks,HcalEndcapNRawHitAssociations' vs 'HcalEndcapNIslandProtoClusters,HcalEndcapNRawHitLinks,HcalEndcapNRawHitAssociations'
15:06:22.830  [warn] Parameter 'EHCAL:HcalEndcapNClustersWithoutShapes:OutputTags' has conflicting defaults: 'HcalEndcapNSplitMergeClustersWithoutShapes,HcalEndcapNSplitMergeClusterLinksWithoutShapes,HcalEndcapNSplitMergeClusterAssociationsWithoutShapes' vs 'HcalEndcapNClustersWithoutShapes,HcalEndcapNClusterLinksWithoutShapes,HcalEndcapNClusterAssociationsWithoutShapes'
[] [GeoSvc] [info] Initializing geometry service from pre-initialized detector
[] [acts] [info] loading materials map from file: 'calibrations/materials-map.cbor'
[] [acts] [info] Converting DD4Hep geometry to ACTS...
[] [acts] [info] CONV           Translating DD4hep geometry into Acts geometry
[] [acts] [info] CONV           Translating DD4hep sub detector: acts_beampipe_central
[] [acts] [info] CONV           Translating DD4hep sub detector: VertexBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: InnerSiTrackerSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: MiddleSiBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterSiBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: MiddleSiEndcapSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterSiEndcapSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EndcapMPGDSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: InnerMPGDBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EndcapTOFSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: BarrelTOFSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterBarrelMPGDSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EcalBarrelTrackerSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: B0TrackerSubAssembly
[] [acts] [info] DD4Hep geometry converted!
[] [acts] [info] Checking surfaces...
[] [acts] [info] Loading magnetic field...
[] [acts] [info] ActsGeometryProvider initialization complete
[] [RandomSvc] [info] Custom random seed requested: 1
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/pfrich.lut"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/tof.lut"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/hpdirc.lut.gz"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/drich.lut.gz"
[] [BEMC:EcalBarrelScFiProtoClusters] [info] Clustering uses localDistXZ with distances <= [80,80]
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Global [t, z] distance between hits <= [2.0000 mm, 2.0000 mm].
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 2): Global [eta, phi] distance between hits <= [0.0100, 0.0100 rad].
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 30.0000 mm.
[] [FEMC:EcalEndcapPIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.5,1.5]
[] [EHCAL:HcalEndcapNIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [150,150]
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [15.5000 mm, 13.4234 mm].
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [7.7500 mm, 6.7117 mm].
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[] [B0ECAL:B0ECalIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.8,1.8]
[] [ZDC:EcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [500,500]
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[] [ZDC:HcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [26.84,26.84]
[] [ZDC:HcalFarForwardZDCIslandProtoClustersBaseline] [info] Clustering uses localDistXY with distances <= [500,500]
[] [richgeo] [error] ReadoutGeo is not defined for detector 'PFRICH'
15:06:46.030  [info] Creating event pool with level=PhysicsEvent and size=1
15:06:46.057  [info] Created event pool with level=PhysicsEvent and size=1
15:06:46.057  [info] Arrow topology is:
15:06:46.057  [info]   ---------------------------------------------------
15:06:46.057  [info]         Arrow         Parallel  Direction  Place   ID  
15:06:46.057  [info]   ------------------  --------  ---------  ------  --  
15:06:46.057  [info]   PhysicsEventSource     0      Input      Pool    1   
15:06:46.057  [info]                                 Output     Queue   0   
15:06:46.057  [info]   PhysicsEventMap2       1      Input      Queue   0   
15:06:46.057  [info]                                 Output     Pool    1   
15:06:46.057  [info]   ---------------------------------------------------
15:06:46.057  [info] 
15:06:46.057  [warn] To pause processing and inspect, press Ctrl-C.
15:06:46.057  [warn] For a clean shutdown, press Ctrl-C twice.
15:06:46.057  [warn] For a hard shutdown, press Ctrl-C three times.
15:06:46.057  [warn] For worker status information, press Ctrl-Z, or run `jana-status 37883`
15:06:46.057  [info] Initialized JEventSource 'JEventSourcePODIO' ('/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root')
[] [JEventProcessorPODIO] [info] Using 'root' backend for output file: /repro/debug-out2.eicrecon.edm4eic.root
15:06:46.126  [info] Initialized JEventProcessor 'JEventProcessorPODIO'
15:06:46.126  [info] Initialized JEventProcessor 'JEventProcessorJANATOP'
15:06:46.126  [info] Configuration Parameters
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         dd4hep:xml_files
15:06:46.126  [info]    value:       /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml
15:06:46.126  [info]    default:     /opt/local/share/epic/epic.xml
15:06:46.126  [info]    description: Comma separated list of XML files describing the DD4hep geometry. (Defaults to ${DETECTOR_PATH}/${DETECTOR_CONFIG}.xml using envars.)
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:parameter_strictness
15:06:46.126  [info]    value:       2
15:06:46.126  [info]    default:     1
15:06:46.126  [info]    description: 0: Ignore unused parameters
15:06:46.126  [info]                 1: Warn on unused parameters
15:06:46.126  [info]                 2: Throw on unused parameters
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:timeout
15:06:46.126  [info]    value:       0
15:06:46.126  [info]    default:     8
15:06:46.126  [info]    description: Max time (in seconds) JANA will wait for a thread to update its heartbeat before hard-exiting. 0 to disable timeout completely.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:warmup_timeout
15:06:46.126  [info]    value:       0
15:06:46.126  [info]    default:     30
15:06:46.126  [info]    description: Max time (in seconds) JANA will wait for 'initial' events to complete before hard-exiting.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         plugins
15:06:46.126  [info]    value:       log,dd4hep,evaluator,acts,algorithms_init,pid_lut,richgeo,rootfile,beam,reco,tracking,particle_flow,pid,global_pid_lut,EEMC,BEMC,FEMC,EHCAL,BHCAL,FHCAL,B0ECAL,ZDC,BTRK,BVTX,PFRICH,DIRC,DRICH,ECTRK,MPGD,B0TRK,RPOTS,FOFFMTRK,BTOF,ECTOF,LOWQ2,LUMISPECCAL,podio,janatop
15:06:46.126  [info]    default:     
15:06:46.126  [info]    description: Comma-separated list of plugins to load.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         podio:output_file
15:06:46.126  [info]    value:       /repro/debug-out2.eicrecon.edm4eic.root
15:06:46.126  [info]    default:     podio_output.root
15:06:46.126  [info]    description: Name of EDM4hep/podio output file to write to. Setting this will cause the output file to be created and written to.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         RECORD_CALL_STACK
15:06:46.127  [info]    value:       1
15:06:46.127  [info]    default:     0
15:06:46.127  [info]    description: Records a trace of who called each factory. Reduces performance but necessary for plugins such as janadot.
15:06:46.127  [warn]    warning:     RECORD_CALL_STACK: Advanced
15:06:46.127  [info] 
15:06:46.127  [warn] Starting processing with 1 threads requested...
[New Thread 0x7f5ccaa1c6c0 (LWP 37898)]
15:06:46.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[] [JEventSourcePODIO] [info] PODIO version: file=1.7.0 (executable=1.7.0)
[] [JEventSourcePODIO] [info] Opened PODIO file "/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root" with 701 events (format auto-detected)
15:06:46.150  [info] Opened JEventSource 'JEventSourcePODIO' ('/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root')
[] [B0ECAL:B0ECalIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.8,1.8]
[e:80615] [BEMC:EcalBarrelScFiProtoClusters] [info] Clustering uses localDistXZ with distances <= [80,80]
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Global [t, z] distance between hits <= [2.0000 mm, 2.0000 mm].
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 2): Global [eta, phi] distance between hits <= [0.0100, 0.0100 rad].
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 30.0000 mm.
15:06:46.629  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
15:06:47.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[e:80615] [FEMC:EcalEndcapPIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.5,1.5]
[e:80615] [ZDC:EcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [500,500]
[e:80615] [EHCAL:HcalEndcapNIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [150,150]
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [15.5000 mm, 13.4234 mm].
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [7.7500 mm, 6.7117 mm].
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[e:80615] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80615] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
#--------------------------------------------------------------------------
#                         FastJet release 3.5.0
#                 M. Cacciari, G.P. Salam and G. Soyez                  
#     A software package for jet finding and analysis at colliders      
#                           https://fastjet.fr                           
#	                                                                      
# Please cite EPJC72(2012)1896 [arXiv:1111.6097] if you use this package
# for scientific work and optionally PLB641(2006)57 [hep-ph/0512210].   
#                                                                       
# FastJet is provided without warranty under the GNU GPL v2 or higher.  
# It uses T. Chan's closest pair algorithm, S. Fortune's Voronoi code
# and 3rd party plugin jet algorithms. See COPYING file for details.
#--------------------------------------------------------------------------
15:06:47.629  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[e:80615] [ZDC:HcalFarForwardZDCIslandProtoClustersBaseline] [info] Clustering uses localDistXY with distances <= [500,500]
15:06:48.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
15:06:48.629  [info] Status: 1 events processed at 2.0 Hz (0.4 Hz avg)
15:06:49.130  [info] Status: 1 events processed at 0.0 Hz (0.3 Hz avg)
[e:80616] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80616] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:49.630  [info] Status: 1 events processed at 0.0 Hz (0.3 Hz avg)
15:06:50.130  [info] Status: 2 events processed at 2.0 Hz (0.5 Hz avg)
15:06:50.630  [info] Status: 2 events processed at 0.0 Hz (0.4 Hz avg)
[e:80617] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80617] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:51.130  [info] Status: 2 events processed at 0.0 Hz (0.4 Hz avg)
15:06:51.630  [info] Status: 3 events processed at 2.0 Hz (0.5 Hz avg)
15:06:52.130  [info] Status: 3 events processed at 0.0 Hz (0.5 Hz avg)
15:06:52.630  [info] Status: 3 events processed at 0.0 Hz (0.5 Hz avg)
15:06:53.130  [info] Status: 3 events processed at 0.0 Hz (0.4 Hz avg)
[e:80618] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80618] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:53.630  [info] Status: 3 events processed at 0.0 Hz (0.4 Hz avg)
15:06:54.131  [info] Status: 4 events processed at 2.0 Hz (0.5 Hz avg)
[e:80619] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80619] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:54.631  [info] Status: 4 events processed at 0.0 Hz (0.5 Hz avg)
15:06:55.131  [info] Status: 5 events processed at 2.0 Hz (0.6 Hz avg)
15:06:55.631  [info] Status: 5 events processed at 0.0 Hz (0.5 Hz avg)
[e:80620] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80620] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:56.131  [info] Status: 5 events processed at 0.0 Hz (0.5 Hz avg)
15:06:56.631  [info] Status: 6 events processed at 2.0 Hz (0.6 Hz avg)
15:06:57.131  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:57.631  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
[e:80621] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80621] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:58.131  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:58.631  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:59.131  [info] Status: 7 events processed at 2.0 Hz (0.5 Hz avg)
[e:80622] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80622] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:59.632  [info] Status: 7 events processed at 0.0 Hz (0.5 Hz avg)
15:07:00.132  [info] Status: 8 events processed at 2.0 Hz (0.6 Hz avg)
15:07:00.632  [info] Status: 8 events processed at 0.0 Hz (0.6 Hz avg)
[e:80623] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80623] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:01.132  [info] Status: 8 events processed at 0.0 Hz (0.5 Hz avg)
15:07:01.632  [info] Status: 9 events processed at 2.0 Hz (0.6 Hz avg)
[e:80624] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80624] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:02.132  [info] Status: 9 events processed at 0.0 Hz (0.6 Hz avg)
15:07:02.632  [info] Status: 10 events processed at 2.0 Hz (0.6 Hz avg)
15:07:03.132  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
[e:80625] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80625] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:03.632  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
15:07:04.132  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
15:07:04.633  [info] Status: 11 events processed at 2.0 Hz (0.6 Hz avg)
15:07:05.133  [info] Status: 11 events processed at 0.0 Hz (0.6 Hz avg)
[e:80626] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80626] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:05.633  [info] Status: 11 events processed at 0.0 Hz (0.6 Hz avg)
[e:80626] [pid:ChargedParticlesWithAssociations] [error] found CherenkovParticleID object with no hypotheses
15:07:06.133  [info] Status: 12 events processed at 2.0 Hz (0.6 Hz avg)
[e:80627] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80627] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:06.633  [info] Status: 12 events processed at 0.0 Hz (0.6 Hz avg)
15:07:07.133  [info] Status: 12 events processed at 0.0 Hz (0.6 Hz avg)
15:07:07.633  [info] Status: 13 events processed at 2.0 Hz (0.6 Hz avg)
15:07:08.133  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
15:07:08.633  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
[e:80628] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80628] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:09.133  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
15:07:09.633  [info] Status: 14 events processed at 2.0 Hz (0.6 Hz avg)
[e:80629] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80629] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:10.134  [info] Status: 14 events processed at 0.0 Hz (0.6 Hz avg)
15:07:10.634  [info] Status: 14 events processed at 0.0 Hz (0.6 Hz avg)
15:07:11.134  [info] Status: 15 events processed at 2.0 Hz (0.6 Hz avg)
[e:80630] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80630] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:11.634  [info] Status: 15 events processed at 0.0 Hz (0.6 Hz avg)
15:07:12.134  [info] Status: 16 events processed at 2.0 Hz (0.6 Hz avg)
[e:80631] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80631] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:12.634  [info] Status: 16 events processed at 0.0 Hz (0.6 Hz avg)
15:07:13.134  [info] Status: 17 events processed at 2.0 Hz (0.6 Hz avg)
[e:80632] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80632] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:13.634  [info] Status: 17 events processed at 0.0 Hz (0.6 Hz avg)
15:07:14.134  [info] Status: 18 events processed at 2.0 Hz (0.6 Hz avg)
15:07:14.634  [info] Status: 18 events processed at 0.0 Hz (0.6 Hz avg)
[e:80633] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80633] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:15.134  [info] Status: 18 events processed at 0.0 Hz (0.6 Hz avg)
15:07:15.635  [info] Status: 19 events processed at 2.0 Hz (0.6 Hz avg)
[e:80634] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80634] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:16.135  [info] Status: 19 events processed at 0.0 Hz (0.6 Hz avg)
15:07:16.635  [info] Status: 19 events processed at 0.0 Hz (0.6 Hz avg)
15:07:17.135  [info] Status: 20 events processed at 2.0 Hz (0.6 Hz avg)
15:07:17.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:18.135  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:18.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
[e:80635] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80635] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:19.135  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:19.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:20.135  [info] Status: 21 events processed at 2.0 Hz (0.6 Hz avg)
[e:80636] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80636] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:20.635  [info] Status: 21 events processed at 0.0 Hz (0.6 Hz avg)
15:07:21.136  [info] Status: 22 events processed at 2.0 Hz (0.6 Hz avg)
[e:80637] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80637] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:21.636  [info] Status: 22 events processed at 0.0 Hz (0.6 Hz avg)
15:07:22.136  [info] Status: 23 events processed at 2.0 Hz (0.6 Hz avg)
[e:80638] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80638] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:22.636  [info] Status: 23 events processed at 0.0 Hz (0.6 Hz avg)
15:07:23.136  [info] Status: 24 events processed at 2.0 Hz (0.6 Hz avg)
15:07:23.636  [info] Status: 24 events processed at 0.0 Hz (0.6 Hz avg)
[e:80639] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80639] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:24.136  [info] Status: 24 events processed at 0.0 Hz (0.6 Hz avg)
[e:80639] [pid:ChargedParticlesWithAssociations] [error] found CherenkovParticleID object with no hypotheses
15:07:24.636  [info] Status: 25 events processed at 2.0 Hz (0.6 Hz avg)
15:07:25.136  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:25.636  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:26.136  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:26.637  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:27.137  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
[e:80640] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80640] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:27.637  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:28.137  [info] Status: 26 events processed at 2.0 Hz (0.6 Hz avg)
15:07:28.637  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:29.137  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:29.637  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
[e:80641] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80641] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:30.137  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:30.654  [info] Status: 27 events processed at 1.9 Hz (0.6 Hz avg)
15:07:31.154  [info] Status: 27 events processed at 0.0 Hz (0.6 Hz avg)
[e:80642] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80642] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:31.655  [info] Status: 27 events processed at 0.0 Hz (0.6 Hz avg)
15:07:32.155  [info] Status: 28 events processed at 2.0 Hz (0.6 Hz avg)
15:07:32.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:33.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:33.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:34.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:34.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
[e:80643] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80643] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:35.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:35.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:36.155  [info] Status: 29 events processed at 2.0 Hz (0.6 Hz avg)
15:07:36.655  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
15:07:37.155  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
[e:80644] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80644] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:37.656  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
15:07:38.156  [info] Status: 30 events processed at 2.0 Hz (0.6 Hz avg)
[e:80645] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80645] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:38.656  [info] Status: 30 events processed at 0.0 Hz (0.6 Hz avg)
15:07:39.156  [info] Status: 31 events processed at 2.0 Hz (0.6 Hz avg)
15:07:39.656  [info] Status: 31 events processed at 0.0 Hz (0.6 Hz avg)
15:07:40.156  [info] Status: 31 events processed at 0.0 Hz (0.6 Hz avg)
[e:80646] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80646] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:40.656  [info] Status: 32 events processed at 2.0 Hz (0.6 Hz avg)
15:07:41.156  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
15:07:41.656  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
[e:80647] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80647] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:42.156  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
15:07:42.656  [info] Status: 33 events processed at 2.0 Hz (0.6 Hz avg)
15:07:43.157  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
15:07:43.657  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
[e:80648] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80648] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:44.157  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
15:07:44.657  [info] Status: 34 events processed at 2.0 Hz (0.6 Hz avg)
15:07:45.157  [info] Status: 34 events processed at 0.0 Hz (0.6 Hz avg)
[e:80649] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80649] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:45.657  [info] Status: 35 events processed at 2.0 Hz (0.6 Hz avg)
[e:80650] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80650] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:46.157  [info] Status: 35 events processed at 0.0 Hz (0.6 Hz avg)
15:07:46.657  [info] Status: 35 events processed at 0.0 Hz (0.6 Hz avg)
15:07:47.157  [info] Status: 36 events processed at 2.0 Hz (0.6 Hz avg)
[e:80651] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80651] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:47.657  [info] Status: 36 events processed at 0.0 Hz (0.6 Hz avg)
15:07:48.158  [info] Status: 36 events processed at 0.0 Hz (0.6 Hz avg)
15:07:48.658  [info] Status: 37 events processed at 2.0 Hz (0.6 Hz avg)
15:07:49.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:49.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:50.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:50.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:51.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:51.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
[e:80652] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80652] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:52.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:52.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:53.158  [info] Status: 38 events processed at 2.0 Hz (0.6 Hz avg)
15:07:53.658  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:54.159  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:54.659  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
[e:80653] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80653] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:55.159  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:55.659  [info] Status: 39 events processed at 2.0 Hz (0.6 Hz avg)
15:07:56.159  [info] Status: 39 events processed at 0.0 Hz (0.6 Hz avg)
15:07:56.659  [info] Status: 39 events processed at 0.0 Hz (0.6 Hz avg)
[e:80654] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80654] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:57.159  [info] Status: 39 events processed at 0.0 Hz (0.5 Hz avg)
[e:80655] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80655] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:57.659  [info] Status: 40 events processed at 2.0 Hz (0.6 Hz avg)
15:07:58.159  [info] Status: 40 events processed at 0.0 Hz (0.6 Hz avg)
15:07:58.659  [info] Status: 41 events processed at 2.0 Hz (0.6 Hz avg)
[e:80656] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80656] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:59.159  [info] Status: 41 events processed at 0.0 Hz (0.6 Hz avg)
15:07:59.660  [info] Status: 42 events processed at 2.0 Hz (0.6 Hz avg)
15:08:00.160  [info] Status: 42 events processed at 0.0 Hz (0.6 Hz avg)
[e:80657] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80657] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:00.660  [info] Status: 42 events processed at 0.0 Hz (0.6 Hz avg)
15:08:01.160  [info] Status: 43 events processed at 2.0 Hz (0.6 Hz avg)
[e:80658] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80658] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:01.660  [info] Status: 43 events processed at 0.0 Hz (0.6 Hz avg)
15:08:02.160  [info] Status: 43 events processed at 0.0 Hz (0.6 Hz avg)
15:08:02.660  [info] Status: 44 events processed at 2.0 Hz (0.6 Hz avg)
15:08:03.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:03.660  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:04.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:04.660  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
[e:80659] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80659] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:05.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:05.686  [info] Status: 45 events processed at 1.9 Hz (0.6 Hz avg)
15:08:06.186  [info] Status: 45 events processed at 0.0 Hz (0.6 Hz avg)
[e:80660] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80660] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:06.686  [info] Status: 45 events processed at 0.0 Hz (0.6 Hz avg)
15:08:07.186  [info] Status: 46 events processed at 2.0 Hz (0.6 Hz avg)
15:08:07.686  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
[e:80661] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80661] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:08.186  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
15:08:08.686  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
15:08:09.186  [info] Status: 47 events processed at 2.0 Hz (0.6 Hz avg)
15:08:09.686  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:10.186  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:10.687  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:11.187  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:11.687  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:12.187  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:12.687  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:13.187  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)

Thread 2 "eicrecon" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f5ccaa1c6c0 (LWP 37898)]
0x00007f5cdb743aac in Acts::detail_vmt::VectorMultiTrajectoryBase::has_impl<Acts::VectorMultiTrajectory const> (instance=..., key=1477579707, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:236
236	        return instance.m_index[istate].ipredicted != kInvalid;
```

Verify that GDB is aware of the DWARF remaps recorded in `/repro/combined-gdbinit`:

```bash
(gdb) show substitute-path
List of all source path substitution rules:
  `./build/src/algorithms/calorimetry' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry'.
  `./build/src/algorithms/digi' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi'.
  `./build/src/algorithms/fardetectors' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors'.
  `./build/src/algorithms/onnx' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx'.
  `./build/src/algorithms/particle_flow' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow'.
  `./build/src/algorithms/pid' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid'.
  `./build/src/algorithms/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut'.
  `./build/src/algorithms/reco' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco'.
  `./build/src/algorithms/tracking' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking'.
  `./build/src/benchmarks/reconstruction/femc_studies' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/femc_studies'.
  `./build/src/benchmarks/reconstruction/lfhcal_studies' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/lfhcal_studies'.
  `./build/src/benchmarks/reconstruction/tracking_efficiency' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/tracking_efficiency'.
  `./build/src/benchmarks/reconstruction/tracking_occupancy' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/tracking_occupancy'.
  `./build/src/detectors/B0ECAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL'.
  `./build/src/detectors/B0TRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK'.
  `./build/src/detectors/BEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC'.
  `./build/src/detectors/BHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL'.
  `./build/src/detectors/BTOF' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF'.
  `./build/src/detectors/BTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK'.
  `./build/src/detectors/BVTX' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX'.
  `./build/src/detectors/DIRC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC'.
  `./build/src/detectors/DRICH' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH'.
  `./build/src/detectors/ECTOF' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF'.
  `./build/src/detectors/ECTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK'.
  `./build/src/detectors/EEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC'.
  `./build/src/detectors/EHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL'.
  `./build/src/detectors/FEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC'.
  `./build/src/detectors/FHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL'.
  `./build/src/detectors/FOFFMTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK'.
  `./build/src/detectors/LOWQ2' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2'.
  `./build/src/detectors/LUMISPECCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL'.
  `./build/src/detectors/MPGD' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD'.
  `./build/src/detectors/PFRICH' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH'.
  `./build/src/detectors/RPOTS' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS'.
  `./build/src/detectors/ZDC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC'.
  `./build/src/global/beam' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam'.
  `./build/src/global/particle_flow' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow'.
  `./build/src/global/pid' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid'.
  `./build/src/global/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut'.
  `./build/src/global/reco' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco'.
  `./build/src/global/tracking' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking'.
  `./build/src/services/algorithms_init' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init'.
  `./build/src/services/evaluator' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator'.
  `./build/src/services/geometry/acts' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts'.
  `./build/src/services/geometry/dd4hep' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep'.
  `./build/src/services/geometry/richgeo' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo'.
  `./build/src/services/io/podio' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio'.
  `./build/src/services/log' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log'.
--Type <RET> for more, q to quit, c to continue without paging--c
  `./build/src/services/particle' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/particle'.
  `./build/src/services/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut'.
  `./build/src/services/rootfile' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile'.
  `./build/src/tests/algorithms_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/algorithms_test'.
  `./build/src/tests/geometry_navigation_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/geometry_navigation_test'.
  `./build/src/tests/track_propagation_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/track_propagation_test'.
  `./build/src/tests/tracking_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/tracking_test'.
  `./build/src/utilities/dump_flags' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/dump_flags'.
  `./build/src/utilities/eicrecon' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/eicrecon'.
  `./build/src/utilities/janatop' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/janatop'.
  `./build/Core' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core'.
  `./build/Examples/Algorithms/AmbiguityResolution' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/AmbiguityResolution'.
  `./build/Examples/Algorithms/Digitization' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Digitization'.
  `./build/Examples/Algorithms/Fatras' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Fatras'.
  `./build/Examples/Algorithms/Geant4' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Geant4'.
  `./build/Examples/Algorithms/Generators' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Generators'.
  `./build/Examples/Algorithms/MaterialMapping' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/MaterialMapping'.
  `./build/Examples/Algorithms/Printers' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Printers'.
  `./build/Examples/Algorithms/Propagation' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Propagation'.
  `./build/Examples/Algorithms/TrackFinding' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFinding'.
  `./build/Examples/Algorithms/TrackFindingML' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFindingML'.
  `./build/Examples/Algorithms/TrackFitting' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFitting'.
  `./build/Examples/Algorithms/TruthTracking' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TruthTracking'.
  `./build/Examples/Algorithms/Utilities' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Utilities'.
  `./build/Examples/Algorithms/Vertexing' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Vertexing'.
  `./build/Examples/Detectors/Common' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/Common'.
  `./build/Examples/Detectors/DD4hepDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/DD4hepDetector'.
  `./build/Examples/Detectors/Geant4Detector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/Geant4Detector'.
  `./build/Examples/Detectors/GenericDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/GenericDetector'.
  `./build/Examples/Detectors/MagneticField' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/MagneticField'.
  `./build/Examples/Detectors/TGeoDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/TGeoDetector'.
  `./build/Examples/Detectors/TelescopeDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/TelescopeDetector'.
  `./build/Examples/Framework' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Framework'.
  `./build/Examples/HelloWorld' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/HelloWorld'.
  `./build/Examples/Io/Csv' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Csv'.
  `./build/Examples/Io/EDM4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/EDM4hep'.
  `./build/Examples/Io/HepMC3' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/HepMC3'.
  `./build/Examples/Io/Json' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Json'.
  `./build/Examples/Io/Obj' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Obj'.
  `./build/Examples/Io/Podio' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Podio'.
  `./build/Examples/Io/Root' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Root'.
  `./build/Examples/Io/Svg' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Svg'.
  `./build/Fatras' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Fatras'.
  `./build/Plugins/ActSVG' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/ActSVG'.
  `./build/Plugins/DD4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep'.
  `./build/Plugins/EDM4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/EDM4hep'.
  `./build/Plugins/FpeMonitoring' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/FpeMonitoring'.
  `./build/Plugins/Geant4' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Geant4'.
  `./build/Plugins/Json' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json'.
  `./build/Plugins/Onnx' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Onnx'.
  `./build/Plugins/Root' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root'.
  `./build/Python/Core' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Core'.
  `./build/Python/Examples' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Examples'.
  `./build/Python/Plugins' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Plugins'.
  `.' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7'.
```

Inspect the backtrace with full local-variable information:

```bash
(gdb) bt full
#0  Acts::detail_vmt::VectorMultiTrajectoryBase::component_impl<true, Acts::VectorMultiTrajectory const> (instance=..., key=4099663144, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:275
        it = <optimized out>
        col = <optimized out>
#1  0x00007fe31420d731 in Acts::VectorMultiTrajectory::component_impl (this=<optimized out>, key=4099663144, istate=<optimized out>)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:492
No locals.
#2  Acts::MultiTrajectory<Acts::VectorMultiTrajectory>::component<unsigned int, 4099663144u> (this=<optimized out>, istate=<optimized out>)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/MultiTrajectory.hpp:696
No locals.
#3  Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>::component<unsigned int, 4099663144u> (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxy.hpp:674
No locals.
#4  Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>, false>::previous (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxyCommon.hpp:71
No locals.
#5  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::processSelectedTrackStates (this=<optimized out>, begin=..., end=..., trackStates=..., isOutlier=false, logger=...)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:265
        candidateTrackState = @0x7fe2c71bc230: {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, 
          m_traj = {m_ptr = 0x0}, m_istate = 37}
        mask = 27
        trackState = {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, m_traj = {m_ptr = 0x0}, 
          m_istate = 0}
        typeFlags = <optimized out>
        it = {_M_current = 0x7fe2c71bc230}
        resultTrackStateList = <optimized out>
        trackStateList = @0x7fe3034de2e0: {<boost::container::small_vector_base<unsigned int, void, void>> = {<boost::container::vector<unsigned int, boost::container::small_vector_allocator<unsigned int, boost::container::new_allocator<void>, void>, void>> = {
              m_holder = {<boost::container::small_vector_allocator<unsigned int, boost::container::new_allocator<void>, void>> = {<boost::container::new_allocator<unsigned int>> = {<No data fields>}, <No data fields>}, m_start = 0x7fe3034de2f8, m_size = 0, m_capacity = 10}}, <No data fields>}, <boost::container::small_vector_storage<unsigned int, 10, 4>> = {m_storage = {aligner = {
                data = "\001\000\000\000\001", '\000' <repeats 11 times>, "\020\026ށ\nV\000\000\001\000\000\000\000\000\000\000\020\026ށ\nV\000"}, 
              data = "\001\000\000\000\001", '\000' <repeats 11 times>, "\020\026ށ\nV\000\000\001\000\000\000\000\000\000\000\020\026ށ\nV\000"}}, <No data fields>}
        firstTrackState = {<std::_Optional_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, true, true>> = {<std::_Optional_base_impl<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, std::_Optional_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, true, true> >> = {<No data fields>}, 
            _M_payload = {<std::_Optional_payload_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> >> = {_M_payload = {_M_empty = {<No data fields>}, 
                  _M_value = {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, m_traj = {
                      m_ptr = <optimized out>}, m_istate = 0}}, 
                _M_engaged = false}, <No data fields>}}, <std::_Enable_copy_move<true, true, true, true, std::optional<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> > >> = {<No data fields>}, <No data fields>}
        resultTrackStateList = <optimized out>
        trackStateList = <optimized out>
        firstTrackState = <optimized out>
        it = <optimized out>
        candidateTrackState = <optimized out>
        mask = <optimized out>
        trackState = <optimized out>
        typeFlags = <optimized out>
        os = <optimized out>
...
#38 0x00007fe305e52c0c in JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::Process (this=0x560a774c8a70, event=...) at ./src/extensions/jana/JOmniFactory.h:543
        input = <optimized out>
        __for_range = @0x560a774c8cf0: {<std::_Vector_base<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*, std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*> >> = {
            _M_impl = {<std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*>> = {<std::__new_allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*>> = {<No data fields>}, <No data fields>}, <std::_Vector_base<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*, std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*> >::_Vector_impl_data> = {_M_start = 0x560a775b6970, _M_finish = 0x560a775b6998, 
                _M_end_of_storage = 0x560a775b69b0}, <No data fields>}}, <No data fields>}
        __for_begin = <optimized out>
        __for_end = <optimized out>
#39 0x00007fe33481afc5 in JFactory::Create(JEvent const&) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#40 0x00007fe307cc4c7f in JEvent::GetCollectionBase (this=0x560a8fa56d90, unique_name=..., throw_on_missing=<optimized out>)
    at /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/include/JANA/JEvent.h:520
        cg_entry = {m_call_graph = @0x560a8fa56ef0, m_factory = 0x560a774c8a70}
        fac = 0x560a774c8a70
        bundle = <optimized out>
        typed_bundle = 0x560a8f855e70
#41 0x00007fe303d6674f in JEventProcessorPODIO::Process (this=0x560a43279bf0, event=...) at ./src/services/io/podio/JEventProcessorPODIO.cc:786
        coll_ptr = <optimized out>
        coll = <optimized out>
        __for_range = @0x560a43279ed0: {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
            _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<std::__new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x7fe2ea412100, _M_finish = 0x7fe2ea415160, 
                _M_end_of_storage = 0x7fe2ea416100}, <No data fields>}}, <No data fields>}
        __for_begin = <optimized out>
        __for_end = <optimized out>
        successful_collections = {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
            _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<std::__new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x7fe2b95de630, _M_finish = 0x7fe2b95de810, 
                _M_end_of_storage = 0x7fe2b95de830}, <No data fields>}}, <No data fields>}
        failed_collections = {_M_t = {
            _M_impl = {<std::allocator<std::_Rb_tree_node<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {<std::__new_allocator<std::_Rb_tree_node<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {<No data fields>}, <No data fields>}, <std::_Rb_tree_key_compare<std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
                _M_key_compare = {<std::binary_function<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, bool>> = {<No data fields>}, <No data fields>}}, <std::_Rb_tree_header> = {_M_header = {_M_color = std::_S_red, _M_parent = 0x0, _M_left = 0x7fe3034e6e18, _M_right = 0x7fe3034e6e18}, 
                _M_node_count = 0}, <No data fields>}}}
        frame = <optimized out>
#42 0x00007fe334859835 in void jana::components::JComponent::CallWithJExceptionWrapper<JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&)::{lambda()#3}>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&)::{lambda()#3}) ()
   from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#43 0x00007fe334859cdd in JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#44 0x00007fe33483d723 in JEventMapArrow::fire(JEvent*, std::array<std::pair<JEvent*, int>, 2ul>&, unsigned long&, JArrow::FireResult&) ()
   from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#45 0x00007fe33482fe2e in JExecutionEngine::RunWorker(JExecutionEngine::Worker) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#46 0x00007fe33416c224 in ?? () from /opt/software/linux-x86_64_v2/gcc-runtime-14.2.0-m56uiqkaqqpoi4ncm3vrjwlehuh7cslo/lib/libstdc++.so.6
No symbol table info available.
#47 0x00007fe333ef3b7b in ?? () from /lib/x86_64-linux-gnu/libc.so.6
No symbol table info available.
#48 0x00007fe333f71630 in clone () from /lib/x86_64-linux-gnu/libc.so.6
No symbol table info available.
```

```bash
(gdb) frame 0
#0  Acts::detail_vmt::VectorMultiTrajectoryBase::component_impl<true, Acts::VectorMultiTrajectory const> (instance=..., key=4099663144, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:275
275	        return &instance.m_previous[istate];
(gdb) frame 4
#4  Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>, false>::previous (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxyCommon.hpp:71
71	        .template component<TrackIndexType, detail_tsp::kPreviousKey>();
(gdb) frame 5
#5  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::processSelectedTrackStates (this=<optimized out>, begin=..., end=..., trackStates=..., isOutlier=false, logger=...)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:265
265	          trackStates.makeTrackState(mask, candidateTrackState.previous());
(gdb) list 260,285
260	        mask &= ~PM::Filtered;
261	      }
262	
263	      // copy this trackstate into fitted states MultiTrajectory
264	      auto trackState =
265	          trackStates.makeTrackState(mask, candidateTrackState.previous());
266	      ACTS_VERBOSE("Create SourceLink output track state #"
267	                   << trackState.index() << " with mask: " << mask);
268	
269	      if (it != begin) {
270	        // assign indices pointing to first track state
271	        trackState.shareFrom(*firstTrackState, PM::Predicted);
272	        trackState.shareFrom(*firstTrackState, PM::Jacobian);
273	      } else {
274	        firstTrackState = trackState;
275	      }
276	
277	      // either copy ALL or everything except for predicted and jacobian
278	      trackState.copyFrom(candidateTrackState, mask, false);
279	
280	      auto typeFlags = trackState.typeFlags();
281	      typeFlags.setHasParameters();
282	      typeFlags.setHasMeasurement();
283	      if (trackState.referenceSurface().surfaceMaterial() != nullptr) {
284	        typeFlags.setHasMaterial();
285	      }
```

Crash is in `component_impl` called from `.previous()`, at `TrackStateCreator.hpp:265`. Now see:

```bash
$1 = 37
(gdb) print trackState.m_istate
$2 = 0
(gdb) print candidateTrackState.m_traj.m_ptr == trackState.m_traj.m_ptr
$3 = true
(gdb) print *(Acts::VectorMultiTrajectory*)candidateTrackState.m_traj.m_ptr
annot access memory at address 0x0
(gdb) print &trackStates
$4 = (Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::TrackStateContainerBackend *) 0x7fe2d73e0ac0
(gdb) print candidateTrackState.m_traj.m_ptr
$5 = (Acts::MultiTrajectory<Acts::VectorMultiTrajectory> *) 0x0
(gdb) x/4gx 0x7f5c8088ed40
0x7f5c8088ed40: annot access memory at address 0x7f5c8088ed40
```

`candidateTrackState.m_traj.m_ptr` is ` nullptr`, a null trajectory pointer, and `candidateTrackState.previous()` dereferences it, crashing in `component_impl` trying to read `instance.m_previous[istate]` off a null instance.