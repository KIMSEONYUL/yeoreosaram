@RequestMapping(value="/user/idCheck2", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> idCheck2(HttpServletRequest request, HttpServletResponse response)
   {
      String userId2 = HttpUtil.get(request, "userId2");
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(!StringUtil.isEmpty(userId2))
      {
         if(userService2.userSelect2(userId2) == null) //값이 없다.
         {
            ajaxResponse.setResponse(0, "Success"); // 사용가능 아이디
         }
         else
         {
            ajaxResponse.setResponse(100, "Duplicate ID"); // 중복된 아이디 (Duplicate ID)
         }
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
      }
      
      if(logger.isDebugEnabled())
      {
         logger.debug("[UserController2] /user/idCheck2 response\n" + JsonUtil.toJsonPretty(ajaxResponse));
      }
      
      return ajaxResponse;
   }