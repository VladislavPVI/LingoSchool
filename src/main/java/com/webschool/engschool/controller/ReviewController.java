package com.webschool.engschool.controller;

import com.webschool.engschool.domain.Review;
import com.webschool.engschool.domain.Reviews;
import com.webschool.engschool.repos.ReviewRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("reviews")
public class ReviewController {
    @Autowired
    private ReviewRepo reviewRepo;

    @PostMapping
    public Review create(@RequestBody Review review) {
        return reviewRepo.save(review);
    }

    @GetMapping(produces = "application/json")
    public List<Review> listOfReview() {
        return reviewRepo.findAll();
    }

    @GetMapping(value = "/xml", produces = "application/xml")
    public List<Review> listOfReviewXML() {
        return reviewRepo.findAll();
    }

    @RequestMapping(value = "/viewXSLT")
    public ModelAndView viewXSLT(HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ParserConfigurationException {
        // builds absolute path of the XML file
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.newDocument();
        try {
            //Create JAXB Context
            JAXBContext jaxbContext = JAXBContext.newInstance(Reviews.class);
            //Create Marshaller
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
            //Required formatting??
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            //Write XML to StringWriter
            jaxbMarshaller.marshal(new Reviews(listOfReview()), doc);


        } catch (JAXBException e) {
            e.printStackTrace();
        }


        ModelAndView model = new ModelAndView("XSLTView");
        model.addObject("xmlSource", doc);

        return model;
    }

}
