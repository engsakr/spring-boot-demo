package com.example.demo;

import com.sun.management.OperatingSystemMXBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.hardware.PowerSource;

import java.lang.management.ManagementFactory;
import java.util.Arrays;

@SpringBootApplication
@RestController
public class DemoApplication {

  @RequestMapping("/")
  public String home() {
    return "Hello Sakr NOW";
  }

  public static void main(String[] args) {
    SpringApplication.run(DemoApplication.class, args);
    SystemInfo si = new SystemInfo();
    HardwareAbstractionLayer hal = si.getHardware();
    System.out.println("cpu tempersture: "+hal.getSensors().getCpuTemperature());
    System.out.println("cpu voltage: "+hal.getSensors().getCpuVoltage());
    System.out.println("fan speed: "+hal.getSensors().getFanSpeeds().toString());
    System.out.println("processor: "+hal.getProcessor());
    System.out.println("RAM Total: "+hal.getMemory().getTotal());//(1073741824)
    System.out.println("RAM Avaliable: "+hal.getMemory().getAvailable());

    System.out.println("=======================================================");
    OperatingSystemMXBean osBean =
            (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
//    System.out.println(osBean.getProcessCpuLoad());
//    System.out.println(osBean.getFreeMemorySize());
//    System.out.println(osBean.getTotalMemorySize());
    System.out.println("name: "+osBean.getName());
    System.out.println("getArch: "+osBean.getArch());
    System.out.println("TotalMemorySize: "+osBean.getTotalMemorySize());
    System.out.println("FreeMemorySize: "+osBean.getFreeMemorySize());
    System.out.println("ProcessCpuLoad: "+osBean.getProcessCpuLoad());
    System.out.println("Version: "+osBean.getVersion());
    System.out.println("CpuLoad: "+osBean.getCpuLoad());
    System.out.println("FreeSwapSpaceSize: "+osBean.getFreeSwapSpaceSize());
    System.out.println("ProcessCpuTime: "+osBean.getProcessCpuTime());
    System.out.println("AvailableProcessors: "+osBean.getAvailableProcessors());
    System.out.println("AvailableProcessors: "+osBean.getObjectName());

  }

}
