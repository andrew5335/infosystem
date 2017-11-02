package com.eye2web.infosys.bean;

public class StandardData {

		// 기준치 데이터
		private final String phydraulic1  = ">16/14/12";    // 유압유 주의기준
		private final String phydraulic2  = ">18/16/14";    // 유압유 경고기준
		private final String pgear1 = ">20/18/15";    // 기어유 주의기준
		private final String pgear2 = ">22/20/17";    // 기어유 경고기준
		private final String pengine1 = ">18/16/13";    // 엔진유 주의기준
		private final String pengine2 = ">20/18/15";    // 엔진유 경고기준
		private final String pturbine1 = ">18/16/13";    // 터빈유 주의기준
		private final String pturbine2 = ">20/18/15";    // 터빈유 경고기준
		private final String pbearing1 = ">18/16/13";    // 베어링유 주의기준
		private final String pbearing2 = ">20/18/15";    // 베어링유 경고기준

		private final String whydraulic1  = ">100";    // 유압유 주의기준
		private final String whydraulic2  = ">400";    // 유압유 경고기준
		private final String wgear1 = ">300";    // 기어유 주의기준
		private final String wgear2 = ">600";    // 기어유 경고기준
		private final String wengine1 = ">200";    // 엔진유 주의기준
		private final String wengine2 = ">500";    // 엔진유 경고기준
		private final String wturbine1 = ">50";    // 터빈유 주의기준
		private final String wturbine2 = ">300";    // 터빈유 경고기준
		private final String wair1 = ">100";    // 공기압축기 주의기준
		private final String wair2 = ">400";    // 공기압축기 경고기준
		private final String weht1 = ">250";    // EHT 주의기준
		private final String weht2 = ">400";    // EHT 경고기준

		private final String zddp1 = "Inflection point + 0.2";
		private final String zddp2 = "Initial AN + 1.0";
		private final String aw1 = "Initial AN + 0.2";
		private final String aw2 = "Initial AN + 1.0";
		private final String volume1 = "Initial AN + 0.03";
		private final String volume2 = "Initial AN + 0.05";

		private final String kzddp1 = "변곡점+0.2";
		private final String kzddp2 = "신유산가+1.0";
		private final String kaw1 = "신유산가+0.2";
		private final String kaw2 = "신유산가+1.0";
		private final String kvolume1 = "신유산가+0.03";
		private final String kvolume2 = "신유산가+0.05";

		private final String viscosity1 = "±10% by New";
		private final String viscosity2 = "±15% by New";
		private final String kviscosity1 = "신유점도±10%";
		private final String kviscosity2 = "신유점도±15%";
	    private final double cviscosityA = 0.85;
	    private final double cviscosityB = 0.9;
	    private final double cviscosityC = 1.1;
	    private final double cviscosityD = 1.15;

	    private final String engine = "> 20 (30max)";
	    private final String trucks = "> 100(100max)";
	    private final String loaders = "> 60";
	    private final String tractors = "> 150";
	    private final String transmissions = "> 20-40";
	    private final String oilpressure = "> 20";
	    private final String gearbox = "> 100";
	    private final String rolling = "> 50";

		public String getPhydraulic1() {
			return phydraulic1;
		}
		public String getPhydraulic2() {
			return phydraulic2;
		}
		public String getPgear1() {
			return pgear1;
		}
		public String getPgear2() {
			return pgear2;
		}
		public String getPengine1() {
			return pengine1;
		}
		public String getPengine2() {
			return pengine2;
		}
		public String getPturbine1() {
			return pturbine1;
		}
		public String getPturbine2() {
			return pturbine2;
		}
		public String getPbearing1() {
			return pbearing1;
		}
		public String getPbearing2() {
			return pbearing2;
		}
		public String getWhydraulic1() {
			return whydraulic1;
		}
		public String getWhydraulic2() {
			return whydraulic2;
		}
		public String getWgear1() {
			return wgear1;
		}
		public String getWgear2() {
			return wgear2;
		}
		public String getWengine1() {
			return wengine1;
		}
		public String getWengine2() {
			return wengine2;
		}
		public String getWturbine1() {
			return wturbine1;
		}
		public String getWturbine2() {
			return wturbine2;
		}
		public String getWair1() {
			return wair1;
		}
		public String getWair2() {
			return wair2;
		}
		public String getWeht1() {
			return weht1;
		}
		public String getWeht2() {
			return weht2;
		}
		public String getZddp1() {
			return zddp1;
		}
		public String getZddp2() {
			return zddp2;
		}
		public String getAw1() {
			return aw1;
		}
		public String getAw2() {
			return aw2;
		}
		public String getVolume1() {
			return volume1;
		}
		public String getVolume2() {
			return volume2;
		}
		public String getKzddp1() {
			return kzddp1;
		}
		public String getKzddp2() {
			return kzddp2;
		}
		public String getKaw1() {
			return kaw1;
		}
		public String getKaw2() {
			return kaw2;
		}
		public String getKvolume1() {
			return kvolume1;
		}
		public String getKvolume2() {
			return kvolume2;
		}
		public String getViscosity1() {
			return viscosity1;
		}
		public String getViscosity2() {
			return viscosity2;
		}
		public String getKviscosity1() {
			return kviscosity1;
		}
		public String getKviscosity2() {
			return kviscosity2;
		}
		public double getCviscosityA() {
			return cviscosityA;
		}
		public double getCviscosityB() {
			return cviscosityB;
		}
		public double getCviscosityC() {
			return cviscosityC;
		}
		public double getCviscosityD() {
			return cviscosityD;
		}
		public String getEngine() {
			return engine;
		}
		public String getTrucks() {
			return trucks;
		}
		public String getLoaders() {
			return loaders;
		}
		public String getTractors() {
			return tractors;
		}
		public String getTransmissions() {
			return transmissions;
		}
		public String getOilpressure() {
			return oilpressure;
		}
		public String getGearbox() {
			return gearbox;
		}
		public String getRolling() {
			return rolling;
		}

}
