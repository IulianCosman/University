//package map.project.demo.Tests;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import map.project.demo.Domain.Cabinet;
//import map.project.demo.Domain.Patient;
//import map.project.demo.Repository.CabinetRepository;
//import map.project.demo.Service.CabinetService;
//import map.project.demo.Service.PatientService;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.http.MediaType;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.ResultActions;
//
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
//
//@SpringBootTest
//@AutoConfigureMockMvc
//public class TestController {
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    @Autowired
//    private ObjectMapper objectMapper;
//
//    @Autowired
//    private CabinetService cabinetService;
//
//    @Test
//    void testAddCabinet() throws Exception {
//        Cabinet cabinetToSave = new Cabinet(1, "Test Cabinet");
//
//        ResultActions resultActions = mockMvc.perform(post("/addCabinet")
//                .contentType(MediaType.APPLICATION_JSON)
//                .content(objectMapper.writeValueAsString(cabinetToSave)));
//
//        resultActions.andExpect(status().isOk())
//                .andExpect(content().string("Added successfully."));
//    }
//
//
//    @Test
//    void testGetAllCabinets() throws Exception {
//        mockMvc.perform(get("/getAllCabinets"))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("$").isArray());
//    }
//
//    @Test
//    void testDeleteCabinet() throws Exception {
//        Cabinet newCabinet = new Cabinet("aiurea");
//        cabinetService.save(newCabinet);
//        int cabinetId = newCabinet.getCabinetID();
//
//        mockMvc.perform(get("/deleteCabinet/{cabinetID}", cabinetId))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Deleted successfully."));
//    }
//
//    @Autowired
//    private PatientService patientService;
//
//    @Test
//    void testAddPatient() throws Exception {
//        Patient patientToSave = new Patient(1, "Test Patient", "Test", "2022-09-09", 200);
//
//        ResultActions resultActions = mockMvc.perform(post("/addPatient")
//                .contentType(MediaType.APPLICATION_JSON)
//                .content(objectMapper.writeValueAsString(patientToSave)));
//
//        resultActions.andExpect(status().isOk())
//                .andExpect(content().string("Added successfully."));
//    }
//
//    @Test
//    void testGetAllPatients() throws Exception {
//        mockMvc.perform(get("/getAllPatient"))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("$").isArray());
//    }
//
//    @Test
//    void testDeletePatient() throws Exception {
//        Patient newPatient= new Patient("andreea", "bacea", "2022-09-09", 200);
//        patientService.save(newPatient);
//        int patientId = newPatient.getPatientID();
//
//        mockMvc.perform(get("/deletePatient/{patientID}", patientId))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Deleted successfully."));
//    }
//
//
//    @Test
//    void testIteratePatients() throws Exception {
//        mockMvc.perform(get("/iteratePatients"))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Iterator successful."));
//    }
//
//}
